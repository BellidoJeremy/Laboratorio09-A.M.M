import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galería de Imágenes',
      home: ImageGalleryScreen(),
    );
  }
}

class ImageGalleryScreen extends StatelessWidget {
  final List<String> imageNames = ['Pintura.png', 'Manzana.jpg', 'Gatito.svg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galería de Imágenes'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: imageNames.length,
        itemBuilder: (context, index) {
          return ImageTile(imageName: imageNames[index]);
        },
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  final String imageName;

  const ImageTile({Key? key, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fileType = imageName.split('.').last.toLowerCase();
    TextStyle textStyle;

    switch (fileType) {
      case 'png':
        textStyle = TextStyle(fontFamily: 'Arial', fontSize: 16);
        break;
      case 'jpg':
        textStyle = TextStyle(fontFamily: 'Times New Roman', fontSize: 16);
        break;
      case 'svg':
        textStyle = TextStyle(fontFamily: 'Roboto', fontSize: 16);
        break;
      default:
        textStyle = TextStyle(fontSize: 16);
    }

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (fileType == 'svg')
            SvgPicture.asset(
              'assets/images/$imageName',
              width: 100,
              height: 100,
            )
          else
            Image.asset(
              'assets/images/$imageName',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          SizedBox(height: 10),
          Text(
            imageName,
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
