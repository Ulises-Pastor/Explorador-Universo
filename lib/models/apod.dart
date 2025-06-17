// Modelo de la imagen del día
class Apod {
  final String title;
  final String explanation;
  final String imageUrl;

  Apod({
    required this.title,
    required this.explanation,
    required this.imageUrl,
  });

  factory Apod.fromJson(Map<String, dynamic> json) {
    return Apod(
      title: json['title'] ?? 'Sin título',
      explanation: json['explanation'] ?? '',
      imageUrl: json['url'] ?? '',
    );
  }
}