import 'package:meta/meta.dart';

@immutable
class ParagraphItem {
  const ParagraphItem(
    this.id,
    this.title,
    this.description,
    this.route,
    this.imageURL, [
    this.isFavourite = false,
  ]);

  final String id;
  final String title;
  final String description;
  final String route;
  final String imageURL;
  final bool isFavourite;

  factory ParagraphItem.empty() {
    return const ParagraphItem("", "", "", "", "");
  }

  ParagraphItem copyWith({
    String id,
    String title,
    String description,
    String route,
    String imageURL,
    bool isFavourite,
  }) {
    return ParagraphItem(
      id ?? this.id,
      title ?? this.title,
      description ?? this.description,
      route ?? this.route,
      imageURL ?? this.imageURL,
      isFavourite ?? this.isFavourite,
    );
  }
}
