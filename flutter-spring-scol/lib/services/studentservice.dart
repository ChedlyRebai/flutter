import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:tp70/entities/student.dart';

import '../entities/classe.dart';

Future getAllStudent() async {
  Response response =
      await http.get(Uri.parse("http://localhost:8080/etudiant/all"));
  return jsonDecode(response.body);
}

Future deleteStudent(int id) {
  return http
      .delete(Uri.parse("http://localhost:8080/etudiant/delete?id=${id}"));
}

Future addStudent(Student student) async {
  print(student.dateNais);
  Response response =
      await http.post(Uri.parse("http://localhost:8080/etudiant/add"),
          headers: {"Content-type": "Application/json"},
          body: jsonEncode(<String, dynamic>{
            "nom": student.nom,
            "prenom": student.prenom,
            "dateNais": DateFormat("yyyy-MM-dd")
                .format(DateTime.parse(student.dateNais)),
            "classe": {
              "codClass": student.classe?.codClass,
              "nomClass": student.classe?.nomClass,
              "nbreEtud": student.classe?.nbreEtud,
            }
          }));
  return response.body;
}

Future updateStudent(Student student) async {
  Response response =
      await http.put(Uri.parse("http://localhost:8080/etudiant/update"),
          headers: {"Content-type": "Application/json"},
          body: jsonEncode(<String, dynamic>{
            "id": student.id,
            "nom": student.nom,
            "prenom": student.prenom,
            "dateNais": DateFormat("yyyy-MM-dd")
                .format(DateTime.parse(student.dateNais)),
            "classe": {
              "codClass": student.classe?.codClass,
              "nomClass": student.classe?.nomClass,
              "nbreEtud": student.classe?.nbreEtud,
            }
          }));
  return response.body;
}

Future<List<Student>> getStudentsByClassQuery(int id) async {
  Response response = await http.get(
    Uri.parse("http://localhost:8080/etudiant/getByClasseId"),
  );

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);

    // Assuming data is a list of students
    List<Student> students =
        data.map((json) => Student.fromJson(json)).toList();

    return students;
  } else {
    throw Exception("Failed to load students by class using query");
  }
}
