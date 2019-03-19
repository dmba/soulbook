import 'package:flutter/material.dart';
import 'package:soulbook/src/model/menu_item.dart';

@immutable
class ParagraphTitle extends StatelessWidget {
  const ParagraphTitle(this.item, this.padding);

  final ParagraphItem item;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.title,
            style: Theme.of(context).textTheme.title,
          ),
          // Empty space:
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(Icons.bookmark_border, size: 20.0),
              SizedBox(width: 5.0),
              Text(
                item.description,
                style: Theme.of(context).textTheme.subtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
