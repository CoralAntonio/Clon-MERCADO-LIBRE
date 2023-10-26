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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 185,
              width: 350,
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}