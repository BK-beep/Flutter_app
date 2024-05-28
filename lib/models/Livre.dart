class Livre {
  final String title;
  final String author;
  final String image;
  final String description;

  Livre({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });

  factory Livre.fromJson(Map<String, dynamic> json) {
    return Livre(
      title: json['title'],
      author: json['author'],
      image: json['image'],
      description: json['description'],
    );
  }
}
