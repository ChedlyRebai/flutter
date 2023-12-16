import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tp70/entities/absence.dart';

import 'package:tp70/entities/classe.dart';
import 'package:tp70/entities/matier.dart';
import 'package:tp70/entities/student.dart';

Future<List<Classe>> getAllClasses() async {
  Response response =
      await http.get(Uri.parse("http://localhost:8080/class/all"));
  List<dynamic> jsonResponse = jsonDecode(response.body);

  // Assuming each item in the jsonResponse can be converted to a Classe
  List<Classe> classes =
      jsonResponse.map((json) => Classe.fromJson(json)).toList();

  return classes;
}

Future<List<Matier>> getAllMatiers() async {
  Response response =
      await http.get(Uri.parse("http://localhost:8080/matier/all"));
  List<dynamic> jsonResponse = jsonDecode(response.body);

  // Assuming each item in the jsonResponse can be converted to a Classe
  List<Matier> matieres =
      jsonResponse.map((json) => Matier.fromJson(json)).toList();

  return matieres;
}

// absence

Future addAbsence(Absence absence) async {
  Response response =
      await http.post(Uri.parse("http://localhost:8080/absence/add"),
          headers: {"Content-type": "Application/json"},
          body: jsonEncode(<String, dynamic>{
            "etudiant": {"id": absence.etudiant?.id},
            "matiere": {"matiereId": absence.matiere?.matiereId},
            "absenceNb": absence.absenceNb,
            "date": absence.date
          }));

  return response.body;
}

Future updateAbsence(Absence absence) async {
  Response response =
      await http.put(Uri.parse("http://localhost:8080/absence/update"),
          headers: {"Content-type": "Application/json"},
          body: jsonEncode(<String, dynamic>{
            "absenceId": absence.absenceId,
            "absenceNb": absence.absenceNb,
            "etudiant": {"id": absence.etudiant?.id},
            "matiere": {"matiereId": absence.matiere?.matiereId},
            "date": absence.date
          }));

  return response.body;
}

Future deleteAbsence(int? id) {
  return http
      .delete(Uri.parse("http://localhost:8080/absence/delete?id=${id}"));
}

Future addMatier(Matier matier, int classId) async {
  Response response = await http.post(
      Uri.parse("http://localhost:8080/matier/add/$classId"),
      headers: {"Content-type": "Application/json"},
      body: jsonEncode(<String, dynamic>{
        "matiereName": matier.matiereName,
        "matiereCoef": matier.matiereCoef
      }));

  return response.body;
}

Future updateMatier(Matier matier) async {
  Response response =
      await http.put(Uri.parse("http://localhost:8080/matier/update"),
          headers: {"Content-type": "Application/json"},
          body: jsonEncode(<String, dynamic>{
            "matiereId": matier.matiereId,
            "matiereName": matier.matiereName,
            "matiereCoef": matier.matiereCoef
          }));

  return response.body;
}

Future deleteMatier(int id) {
  return http.delete(Uri.parse("http://localhost:8080/matier/delete?id=${id}"));
}

Future deleteClass(int id) {
  return http.delete(Uri.parse("http://localhost:8080/class/delete?id=${id}"));
}

Future addClass(Classe classe) async {
  Response response = await http.post(
      Uri.parse("http://localhost:8080/class/add"),
      headers: {"Content-type": "Application/json"},
      body: jsonEncode(<String, dynamic>{
        "nomClass": classe.nomClass,
        "nbreEtud": classe.nbreEtud
      }));

  return response.body;
}

Future updateClasse(Classe classe) async {
  Response response =
      await http.put(Uri.parse("http://localhost:8080/class/update"),
          headers: {"Content-type": "Application/json"},
          body: jsonEncode(<String, dynamic>{
            "codClass": classe.codClass,
            "nomClass": classe.nomClass,
            "nbreEtud": classe.nbreEtud
          }));

  return response.body;
}
