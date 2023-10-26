import 'package:flutter/material.dart';


class ProductList extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductList({
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      margin: EdgeInsets.symmetric(vertical: 17, horizontal: 3),
      child: Container(
        width: 150, // Ajusta el ancho del Card
        height: 220, // Ajusta la altura del Card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150, // Ajusta la altura de la imagen
              width: 150, // Ajusta el ancho de la imagen
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
