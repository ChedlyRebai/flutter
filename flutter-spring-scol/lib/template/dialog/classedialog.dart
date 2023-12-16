import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tp70/entities/classe.dart';
import 'package:tp70/entities/student.dart';
import 'package:tp70/services/classeservice.dart';
import 'package:tp70/services/studentservice.dart';

class ClassDialog extends StatefulWidget {
  final Function()? notifyParent;
  Classe? classe;

  ClassDialog({super.key, @required this.notifyParent, this.classe});
  @override
  State<ClassDialog> createState() => _ClassDialogState();
}

class _ClassDialogState extends State<ClassDialog> {
  TextEditingController nomCtrl = TextEditingController();

  TextEditingController nbrCtrl = TextEditingController();

  String title = "Ajouter Classe";
  bool modif = false;

  late int idClasse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.classe != null) {
      modif = true;
      title = "Modifier Classe";
      nomCtrl.text = widget.classe!.nomClass;
      nbrCtrl.text = (widget.classe!.nbreEtud).toString();
      idClasse = widget.classe!.codClass!;
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
              decoration: const InputDecoration(labelText: "nom"),
            ),
            TextFormField(
              controller: nbrCtrl,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Champs est obligatoire";
                }
                return null;
              },
              decoration:
                  const InputDecoration(labelText: "Nombre des etudiants"),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (modif == false) {
                    await addClass(
                        Classe(int.parse(nbrCtrl.text), nomCtrl.text, []));
                    widget.notifyParent!();
                  } else {
                    await updateClasse(Classe(
                        int.parse(nbrCtrl.text), nomCtrl.text, [], idClasse));
                    widget.notifyParent!();
                  }
                  Navigator.pop(context);
                },
                child: const Text(" Ajouter "))
          ],
        ),
      ),
    );
  }
}
