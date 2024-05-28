import 'package:flutter/material.dart';
import 'package:exam/LivresPage.dart';
import 'package:exam/AdherantsPage.dart';
import 'package:exam/AboutPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "LibraryManager",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/img/library.png'),
            SizedBox(height: 16.0),
            Text(
              'Bienvenue à la Bibliothèque publique',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Notre mission est de fournir un accès gratuit à l\'information, à la culture et à la connaissance à tous les membres de notre communauté.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Baraka Khaoula"),
              accountEmail: Text("baraka.khaoula0@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/img/photo.png"),
              ),
            ),
            ListTile(
              title: Text(
                "Accueil",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text(
                "Livres",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LivresPage()));
              },
              leading: Icon(Icons.book),
            ),
            ListTile(
              title: Text(
                "Adhérents",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdherantsPage()));
              },
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text(
                "À propos",
                style: TextStyle(fontSize: 24),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));
              },
              leading: Icon(Icons.info),
            ),
          ],
        ),
      ),
    );
  }
}
