import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:tp70/entities/student.dart';
import 'package:tp70/services/studentservice.dart';

import '../../entities/classe.dart';
import '../../services/classeservice.dart';
import 'package:http/http.dart' as http;

class AddStudentDialog extends StatefulWidget {
  final Function()? notifyParent;
  Student? student;

  Classe? selectedClasse;

  AddStudentDialog(
      {super.key,
      @required this.notifyParent,
      this.student,
      this.selectedClasse});
  @override
  State<AddStudentDialog> createState() => _AddStudentDialogState();
}

class _AddStudentDialogState extends State<AddStudentDialog> {
  TextEditingController nomCtrl = TextEditingController();

  TextEditingController prenomCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController dateNaisCtrl = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String title = "Ajouter Etudiant";
  bool modif = false;
  late int idStudent;
  Classe? selectedClass;
  List<Classe> classes = [];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        dateCtrl.text =
            DateFormat("yyyy-MM-dd").format(DateTime.parse(picked.toString()));
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selectedClass = widget
        .selectedClasse; // Set selectedClass to the value from the constructor
    print("selected class: ${selectedClass}");
    // Use await to wait for the completion of the Future
    getAllClasses().then((result) {
      // Check if the result is a List<Classe> before assigning
      setState(() {
        classes = result;
      });
    });

    if (widget.student != null) {
      modif = true;
      title = "Modifier Etudiant";
      nomCtrl.text = widget.student!.nom;
      prenomCtrl.text = widget.student!.prenom;
      dateCtrl.text = DateFormat("yyyy-MM-dd")
          .format(DateTime.parse(widget.student!.dateNais.toString()));

      idStudent = widget.student!.id!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(title),
            TextFormField(
              controller: nomCtrl,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Champs est obligatoire";
                }
                return null;
              },
              decoration: const InputDecoration(labelText: "Nom"),
            ),
            TextFormField(
              controller: prenomCtrl,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Champs est obligatoire";
                }
                return null;
              },
              decoration: const InputDecoration(labelText: "Prénom"),
            ),
            TextFormField(
              controller: dateCtrl,
              readOnly: true,
              decoration: const InputDecoration(labelText: "Date de naissance"),
              onTap: () {
                _selectDate(context);
              },
            ),
            DropdownButtonFormField<Classe>(
              value: selectedClass,
              onChanged: (Classe? value) {
                setState(() {
                  selectedClass = value;
                });
              },
              items: classes.map((Classe classe) {
                return DropdownMenuItem<Classe>(
                  value: classe,
                  child: Text(classe.nomClass),
                );
              }).toList(),
              decoration: const InputDecoration(labelText: "Classe"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (modif == false) {
                  await addStudent(Student(
                    dateNais: selectedDate.toString(),
                    nom: nomCtrl.text,
                    prenom: prenomCtrl.text,
                    classe: selectedClass,
                  ));
                  widget.notifyParent!();
                } else {
                  await updateStudent(Student(
                    dateNais: selectedDate.toString(),
                    nom: nomCtrl.text,
                    prenom: prenomCtrl.text,
                    classe: selectedClass,
                    id: idStudent,
                  ));
                  widget.notifyParent!();
                }
                Navigator.pop(context);
              },
              child: const Text("Ajouter"),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Classe>> getAllClasses() async {
  Response response =
      await http.get(Uri.parse("http://localhost:8080/class/all"));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);

    // Assuming data is a list of classes
    List<Classe> classes = data.map((json) => Classe.fromJson(json)).toList();

    return classes;
  } else {
    // If the request was not successful, throw an exception or handle the error.
    throw Exception("Failed to load classes");
  }
}
