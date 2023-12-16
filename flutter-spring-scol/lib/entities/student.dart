import 'classe.dart';

class Student {
  String dateNais, nom, prenom;
  int? id;
  Classe? classe;

  Student({
    required this.dateNais,
    required this.nom,
    required this.prenom,
    this.classe,
    this.id,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      dateNais: json['dateNais'],
      nom: json['nom'],
      prenom: json['prenom'],
      id: json['id'],
      // Assuming 'classe' is a nested object in the JSON
      classe:
          json.containsKey('classe') ? Classe.fromJson(json['classe']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'dateNais': dateNais,
      'classe': classe?.toJson(), // Assuming 'classe' has a toJson method
    };
  }
}
