import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'AdherantDetailPage.dart';
import 'models/Adherant.dart';

class AdherantsPage extends StatefulWidget {
  const AdherantsPage({super.key});

  @override
  State<AdherantsPage> createState() => _AdherantsPageState();
}

class _AdherantsPageState extends State<AdherantsPage> {
  List<Adherant> adherants = [];

  @override
  void initState() {
    super.initState();
    loadAdherants();
  }

  Future<void> loadAdherants() async {
    final String response = await rootBundle.loadString('assets/json/adherants.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      adherants = data.map((json) => Adherant.fromJson(json)).toList();
    });
  }

  final TextEditingController nomController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  void addToList() {
    setState(() {
      adherants.add(Adherant(
        nom: nomController.text,
        id: idController.text,
        image: imageController.text,
      ));
    });
  }

  void deleteItem(int index) {
    setState(() {
      adherants.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adherants"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nom',
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
              controller: nomController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'ID',
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
              controller: idController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'URL de l\'image',
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
            MaterialButton(
              onPressed: () {
                addToList();
                nomController.clear();
                idController.clear();
                imageController.clear();
              },
              child: Text("Ajouter"),
              color: Colors.deepPurple[200],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: adherants.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(adherants[index].id),
                      subtitle: Text(adherants[index].nom),
                      leading: Image.network(
                        adherants[index].image,
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
                            builder: (context) => AdherantDetailPage(
                              id: adherants[index].id,
                              nom: adherants[index].nom,
                              imageUrl: adherants[index].image,
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
