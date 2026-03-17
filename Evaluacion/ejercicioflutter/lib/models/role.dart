class Role {
  final int? id;
  final String name;
  final String? description;

  Role({this.id, required this.name, this.description});

  Map<String, dynamic> toJson() => {
        'nombre_rol': name,
        'descripcion': description,
      };
}