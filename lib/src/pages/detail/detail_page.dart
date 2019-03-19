import 'package:flutter/material.dart';

@immutable
class DetailPage extends StatefulWidget {
  const DetailPage();

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final pages = [
    "assets/block1/notebook5.png",
    "assets/block1/notebook6.png",
    "assets/block1/notebook7.png",
    "assets/block1/notebook8.png",
    "assets/block1/notebook9.png",
    "assets/block1/notebook10.png",
    "assets/block1/notebook11.png",
    "assets/block1/notebook12.png",
    "assets/block1/notebook13.png",
    "assets/block1/notebook14.png",
    "assets/block1/notebook15.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Блок 1: Знакомство"),
      ),
      body: PageView(
        children: pages.map(_buildPage).toList(),
      ),
    );
  }

  Widget _buildPage(String imageURL) {
    return Image.asset(
      imageURL,
      fit: BoxFit.contain,
    );
  }
}
