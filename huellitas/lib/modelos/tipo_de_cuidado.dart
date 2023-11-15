class TipoDeCuidado {
  final int id;
  final String nombre;

  TipoDeCuidado({
    required this.id,
    required this.nombre,
  });

  factory TipoDeCuidado.fromJson(Map<String, dynamic> json) {
    return TipoDeCuidado(
      id: json['id'],
      nombre: json['nombre'],
    );
  }
}
