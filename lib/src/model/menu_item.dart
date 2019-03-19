import 'package:meta/meta.dart';

@immutable
class ParagraphItem {
  const ParagraphItem(
    this.id,
    this.title,
    this.description,
    this.route,
    this.imageURL,
  );

  final String id;
  final String title;
  final String description;
  final String route;
  final String imageURL;

  factory ParagraphItem.empty() {
    return const ParagraphItem("", "", "", "", "");
  }
}
