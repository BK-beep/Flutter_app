import 'package:flutter/material.dart';
import 'models/Livre.dart';

class AjouterLivrePage extends StatefulWidget {
  final Function(Livre) onAjouterLivre;

  const AjouterLivrePage({super.key, required this.onAjouterLivre});

  @override
  _AjouterLivrePageState createState() => _AjouterLivrePageState();
}

class _AjouterLivrePageState extends State<AjouterLivrePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void ajouterLivre() {
    if (titleController.text.isNotEmpty &&
        authorController.text.isNotEmpty &&
        imageController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      widget.onAjouterLivre(Livre(
        title: titleController.text,
        author: authorController.text,
        image: imageController.text,
        description: descriptionController.text,
      ));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un livre'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Titre',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: titleController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Auteur',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: authorController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'URL de l\'image de couverture',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: imageController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              controller: descriptionController,
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: ajouterLivre,
              child: Text("Ajouter"),
              color: Colors.lightGreenAccent[200],
            ),
          ],
        ),
      ),
    );
  }
}
