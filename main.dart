
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista con imágenes y fuentes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista con imágenes y fuentes'),
      ),
      body: ListView(
        children: [
          _buildListItem('Alimentos', 'assets/images/TallarinesRojos', 'Open Sans'),
          _buildListItem('Animales', 'assets/images/TallarinesRojos', 'Lato'),
          _buildListItem('Lugares', 'assets/images/TallarinesRojos', 'Ubuntu'),
        ],
      ),
    );
  }

  Widget _buildListItem(String category, String imageUrl, String fontFamily) {
    return ListTile(
      title: Text(
        category,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Image.network(imageUrl),
    );
  }
}
