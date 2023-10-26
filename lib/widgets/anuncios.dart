import 'package:flutter/material.dart';

class anunciosCard extends StatelessWidget {
  final String image;

  const anunciosCard({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 4),
        child: ClipRRect( 
          borderRadius: BorderRadius.circular(10.0), 
          child: SizedBox(
            height: 120,
            width: 340,
            child: Image.network(
              image,
              fit: BoxFit.fill, 
            ),
          ),
        ),
      ),
    );
  }
}
