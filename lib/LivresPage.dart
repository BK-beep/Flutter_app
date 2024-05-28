import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'LivreDetailPage.dart';
import 'AjouterLivrePage.dart';
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

  void addToList(Livre newLivre) {
    setState(() {
      livres.add(newLivre);
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
      body: ListView.builder(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AjouterLivrePage(onAjouterLivre: addToList),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
