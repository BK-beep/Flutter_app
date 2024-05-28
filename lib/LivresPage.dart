import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'LivreDetailPage.dart';
import 'models/Livre.dart';

class LivresPage extends StatefulWidget {
  const LivresPage({super.key});

  @override
  State<LivresPage> createState() => _LivresPageState();
}

class _LivresPageState extends State<LivresPage> {
  List<Livre> livres = [];

  @override
  void initState() {
    super.initState();
    loadLivres();
  }

  Future<void> loadLivres() async {
    final String response = await rootBundle.loadString('assets/json/livres.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      livres = data.map((json) => Livre.fromJson(json)).toList();
    });
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void addToList() {
    setState(() {
      livres.add(Livre(
        title: titleController.text,
        author: authorController.text,
        image: imageController.text,
        description: descriptionController.text,
      ));
    });
  }

  void deleteItem(int index) {
    setState(() {
      livres.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Livres"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Titre',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
              ),
              controller: titleController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Auteur',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
              ),
              controller: authorController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'URL de l\'image de couverture',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
              ),
              controller: imageController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
              ),
              controller: descriptionController,
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                addToList();
                titleController.clear();
                authorController.clear();
                imageController.clear();
                descriptionController.clear();
              },
              child: Text("Ajouter"),
              color: Colors.deepPurple[200],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: livres.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(livres[index].title),
                      subtitle: Text(livres[index].author),
                      leading: Image.network(
                        livres[index].image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteItem(index);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LivreDetailPage(
                              title: livres[index].title,
                              author: livres[index].author,
                              description: livres[index].description,
                              imageUrl: livres[index].image,
                            ),
                          ),
                        );
                      },
                    ),
                    elevation: 5,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
