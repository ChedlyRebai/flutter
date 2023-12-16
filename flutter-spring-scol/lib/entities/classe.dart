import 'package:tp70/entities/matier.dart';

class Classe {
  int nbreEtud;
  String nomClass;
  int? codClass;
  List<Matier>? matieres;

  Classe(this.nbreEtud, this.nomClass, this.matieres, [this.codClass]);

  // Factory method to create a Classe object from JSON
  factory Classe.fromJson(Map<String, dynamic> json) {
    return Classe(
      json['nbreEtud'],
      json['nomClass'],
      json.containsKey('matieres')
          ? (json['matieres'] as List<dynamic>)
              .map((matiereJson) => Matier.fromJson(matiereJson))
              .toList()
          : null,
      json['codClass'],
    );
  }

  // Add a method to convert the Classe object to JSON
  Map<String, dynamic> toJson() {
    return {
      'nbreEtud': nbreEtud,
      'nomClass': nomClass,
      'codClass': codClass,
    };
  }

  @override
  String toString() {
    return nomClass;
  }
}
