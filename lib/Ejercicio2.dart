import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detalles de Producto',
      home: ProductDetailsScreen(),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductDetailsWidget(),
      ),
    );
  }
}

class ProductDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: 500), // Establecer el tamaño máximo de la imagen
          child: AspectRatio(
            aspectRatio: 16 / 9, // Proporción de aspecto de la imagen
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'assets/images/Manzana.jpg', // URL de la imagen del producto
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Manzana',
          style: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          '\$0.30',
          style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Una baratisima manzana para estar bien de salud',
          style: GoogleFonts.nunito(fontSize: 16),
        ),
      ],
    );
  }
}
