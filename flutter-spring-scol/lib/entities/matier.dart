import 'dart:ffi';

class Matier {
  int? matiereId;
  String matiereName;
  double matiereCoef;

  Matier(this.matiereName, this.matiereCoef, [this.matiereId]);

  // Factory method to create a Classe object from JSON
  factory Matier.fromJson(Map<String, dynamic> json) {
    return Matier(
      json['matiereName'],
      json['matiereCoef'],
      json['matiereId'],
    );
  }

  // Add a method to convert the Classe object to JSON
  Map<String, dynamic> toJson() {
    return {
      'matiereName': matiereName,
      'matiereCoef': matiereCoef,
      'matiereId': matiereId,
    };
  }

  @override
  String toString() {
    return matiereName;
  }
}
