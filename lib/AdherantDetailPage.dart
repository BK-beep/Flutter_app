import 'package:flutter/material.dart';

class AdherantDetailPage extends StatelessWidget {
  final String id;
  final String nom;
  final String imageUrl;

  const AdherantDetailPage({
    Key? key,
    required this.id,
    required this.nom,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                imageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              id,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Nom: $nom',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
