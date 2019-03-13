import 'dart:math';

import 'package:flutter/material.dart';
import 'package:soulbook/src/model/menu_item.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({Key key, this.item}) : super(key: key);

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: _buildListTile(context),
      ),
    );
  }

  Widget _buildListTile(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0),
          ),
        ),
        child: const Icon(
          Icons.autorenew,
        ),
      ),
      title: Text(
        item.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Text(
              item.description,
            ),
          ),
          LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: _nextLoading(),
            valueColor: const AlwaysStoppedAnimation(Colors.green),
          ),
        ],
      ),
      trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0),
      onTap: () {
//        Navigator.push(
//            context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
    );
  }

  double _nextLoading() {
    return (Random().nextInt(80) + 30) / 100;
  }
}
