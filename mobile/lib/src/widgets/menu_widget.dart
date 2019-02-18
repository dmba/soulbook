import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/model/menu_item.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    Key key,
    @required this.accountName,
    @required this.accountEmail,
    @required this.accountAvatar,
    @required this.menuItems,
  }) : super(key: key);

  final String accountName;
  final String accountEmail;
  final String accountAvatar;
  final List<MenuItem> menuItems;

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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: _menuTiles,
      ),
    );
  }

  _mapToListTile(BuildContext context) {
    return (MenuItem item) => ListTile(
          title: Text(item.title),
          subtitle: Text(item.description),
          leading: const Icon(Icons.chevron_right),
          onTap: () => Navigator.pushNamed(context, item.route),
        );
  }
}
