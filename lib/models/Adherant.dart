class Adherant {
  final String nom;
  final String id;
  final String image;

  Adherant({
    required this.nom,
    required this.id,
    required this.image,
  });

  factory Adherant.fromJson(Map<String, dynamic> json) {
    return Adherant(
      nom: json['nom'],
      id: json['id'],
      image: json['image'],
    );
  }
}
