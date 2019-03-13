class MenuItem {
  MenuItem(
    this.title,
    this.description,
    this.route,
  );

  final String title;
  final String description;
  final String route;

  factory MenuItem.empty() {
    return MenuItem("", "", "");
  }
}
