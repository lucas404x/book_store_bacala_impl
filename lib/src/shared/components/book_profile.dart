import 'package:flutter/material.dart';

class BookProfile extends StatelessWidget {
  const BookProfile({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.radius = 12.0,
  });

  final String image;
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
