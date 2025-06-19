// Modelo de la imagen del día
class Objeto {
  final String name;
  final String image;
  final String description;

  Objeto({
    required this.name,
    required this.image,
    required this.description,
  });

  factory Objeto.fromJson(Map<String, dynamic> json) {
    return Objeto(
      name: json['name'] ?? 'Sin título',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
    );
  }
}