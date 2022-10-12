import 'package:flutter/material.dart';

class BookProfile extends StatelessWidget {
  const BookProfile({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
