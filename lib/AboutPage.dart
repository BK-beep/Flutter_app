import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Bibliothèque publique',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Bienvenue à la Bibliothèque publique. Notre mission est de fournir un accès gratuit à l\'information, '
                  'à la culture et à la connaissance à tous les membres de notre communauté. Nous offrons une grande '
                  'sélection de livres, des ressources numériques, et des programmes éducatifs pour les enfants et les adultes.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Pour plus d\'informations, veuillez visiter notre site web ou nous contacter à l\'adresse email suivante : '
                  'info@bibliothequepublique.com.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
