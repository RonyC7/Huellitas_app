class Mascota {
  final int id;
  final String nombre;
  final String especie;
  final String genero;
  final String raza;
  final int edad;

  Mascota({
    required this.id,
    required this.nombre,
    required this.especie,
    required this.genero,
    required this.raza,
    required this.edad,
  });

  factory Mascota.fromJson(Map<String, dynamic> json) {
    return Mascota(
      id: json['id'],
      nombre: json['nombre'],
      especie: json['especie'],
      genero: json['genero'],
      raza: json['raza'],
      edad: json['edad'],
    );
  }
}
