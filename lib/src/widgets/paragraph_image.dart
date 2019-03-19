import 'package:flutter/material.dart';

@immutable
class ParagraphImage extends StatelessWidget {
  const ParagraphImage(this.imageURL);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0,
      child: Image.asset(
        imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}
