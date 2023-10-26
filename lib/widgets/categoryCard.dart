import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imagenUrl;
  final String nameCategory;

  const CategoryCard({
    required this.imagenUrl,
    required this.nameCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 9, left: 9),
          width: 70,
          height: 70,
          child: Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(120),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  imagenUrl,
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 2),
        Text(
          nameCategory,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
