import 'package:flutter/material.dart';
import 'package:soulbook/src/model/menu_item.dart';
import 'package:soulbook/src/widgets/paragraph_image.dart';
import 'package:soulbook/src/widgets/paragraph_title.dart';

@immutable
class ParagraphCard extends StatelessWidget {
  const ParagraphCard({
    @required this.item,
    @required this.inFavorites,
    @required this.onFavoriteButtonPressed,
    @required this.onTap,
  });

  final ParagraphItem item;
  final bool inFavorites;
  final void Function(ParagraphItem) onFavoriteButtonPressed;
  final void Function(ParagraphItem) onTap;

  @override
  Widget build(BuildContext context) {
    RawMaterialButton _buildFavoriteButton() {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
        onPressed: () => onFavoriteButtonPressed(item),
        child: Icon(
          // Conditional expression:
          // show "favorite" icon or "favorite border" icon depending on widget.inFavorites:
          inFavorites == true ? Icons.favorite : Icons.favorite_border,
          color: Theme.of(context).iconTheme.color,
        ),
        elevation: 2.0,
        fillColor: Theme.of(context).buttonColor,
        shape: CircleBorder(),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        child:  InkWell(
          onTap: () => onTap(item),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // We overlap the image and the button by
              // creating a Stack object:
              Stack(
                children: <Widget>[
                  ParagraphImage(item.imageURL),
                  Positioned(
                    child: _buildFavoriteButton(),
                    top: 2.0,
                    right: 2.0,
                  ),
                ],
              ),
              ParagraphTitle(item, 15),
            ],
          ),
        ),
      ),
    );
  }
}
