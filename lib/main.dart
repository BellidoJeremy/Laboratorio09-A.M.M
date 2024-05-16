import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista con Imágenes y Fuentes',
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'category': 'alimento', 'name': 'Manzana', 'image': 'assets/images/Manzana.jpg'},
    {'category': 'alimento', 'name': 'Pizza', 'image': 'assets/images/Pizza.jpeg'},
    {'category': 'animal', 'name': 'Gato', 'image': 'assets/images/Gato.jpg'},
    {'category': 'animal', 'name': 'Perro', 'image': 'assets/images/Perro.jpg'},
    {'category': 'lugar', 'name': 'París', 'image': 'assets/images/Paris.jpg'},
    {'category': 'lugar', 'name': 'Nueva York', 'image': 'assets/images/NuevaYork.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista con Imágenes y Fuentes'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ItemTile(item: items[index]),
              SizedBox(height: 10), 
            ],
          );
        },
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final Map<String, String> item;

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;

    switch (item['category']) {
      case 'alimento':
        textStyle = GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.bold);
        break;
      case 'animal':
        textStyle = GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold);
        break;
      case 'lugar':
        textStyle = GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.bold);
        break;
      default:
        textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    }

    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
      leading: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: item['image']!.startsWith('http')
                ? CachedNetworkImageProvider(item['image']!)
                : AssetImage(item['image']!) as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        item['name']!,
        style: textStyle,
      ),
    );
  }
}
