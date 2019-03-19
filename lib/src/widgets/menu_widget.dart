import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soulbook/src/model/menu_item.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key key,
    @required this.accountName,
    @required this.accountEmail,
    @required this.accountAvatar,
    @required this.menuItems,
    @required this.onSignOut,
  }) : super(key: key);

  final String accountName;
  final String accountEmail;
  final String accountAvatar;
  final List<ParagraphItem> menuItems;
  final Future<void> Function() onSignOut;

  @override
  Widget build(BuildContext context) {
    final _menuTiles = <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text(accountName),
        accountEmail: Text(accountEmail),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(accountAvatar),
              ),
            ),
          ),
        ),
      ),
    ];
    _menuTiles.addAll(menuItems.map(_mapToListTile(context)));
    _menuTiles.add(Divider());
    _menuTiles.add(ListTile(
      title: const Text("Выход"),
      leading: const Icon(Icons.arrow_back),
      onTap: onSignOut,
    ));
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: _menuTiles,
      ),
    );
  }

  _mapToListTile(BuildContext context) {
    return (ParagraphItem item) => ListTile(
          title: Text(item.title),
          subtitle: Text(item.description),
          leading: const Icon(Icons.bookmark_border),
          onTap: () => Navigator.pushNamed(context, item.route),
        );
  }
}
