import 'package:flutter/material.dart';

class vistoUltimamente extends StatelessWidget {
  final String image;
  final String title;


  const vistoUltimamente({
    required this.image,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 17, horizontal: 3),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 10), // Espacio entre la imagen y el título
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 5),

            ],
          ),
        ],
      ),
    );
  }
}
