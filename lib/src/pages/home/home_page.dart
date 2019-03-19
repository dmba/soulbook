import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulbook/src/blocs/home/home.dart';
import 'package:soulbook/src/model/app_user.dart';
import 'package:soulbook/src/model/menu_item.dart';
import 'package:soulbook/src/pages/login/auth.dart';
import 'package:soulbook/src/pages/routes.dart';
import 'package:soulbook/src/utils/state_mixin.dart';
import 'package:soulbook/src/widgets/menu_widget.dart';
import 'package:soulbook/src/widgets/paragraph_card.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  HomePage(this._bloc, this._auth) : super();

  final CounterBloc _bloc;
  final Auth _auth;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with StateMixin {
  static final uuid = Uuid();
  ScrollController _scrollController;

  var user = AppUser.empty();

  List<ParagraphItem> _items = <ParagraphItem>[
    ParagraphItem(
      uuid.v1(),
      "Блок 1",
      "Знакомство",
      "/detail",
      "assets/block1.png",
    ),
    ParagraphItem(
      uuid.v1(),
      "Блок 2",
      "В поисках внутренних ресурсов",
      "/detail",
      "assets/block2.png",
    ),
    ParagraphItem(
      uuid.v1(),
      "Блок 3",
      "Архетипы внутренней семьи",
      "/detail",
      "assets/block3.png",
    ),
    ParagraphItem(
      uuid.v1(),
      "Блок 4",
      "Счастливая Я",
      "/detail",
      "assets/block4.png",
    ),
    ParagraphItem(
      uuid.v1(),
      "Блок 5",
      "Мир отношений",
      "/detail",
      "assets/block5.png",
    ),
  ];

  @override
  void initState() {
    FirebaseAuth.instance.currentUser().then((fireUser) {
      setState(() {
        user = AppUser(
          fireUser.displayName,
          fireUser.email,
          fireUser.photoUrl,
        );
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    widget._bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.title),
      ),
      drawer: MenuWidget(
          accountName: user.displayName,
          accountEmail: user.email,
          accountAvatar: user.photoUrl,
          menuItems: _items,
          onSignOut: () async {
            await widget._auth.signOut();
            navigator.pushReplacementNamed(LOGIN);
          }),
      body: BlocBuilder<CounterEvent, CounterState>(
        bloc: widget._bloc,
        builder: _counterBuilder,
      ),
    );
  }

  Widget _counterBuilder(BuildContext context, CounterState state) {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: _buildItem,
      itemCount: _items.length,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return ParagraphCard(
      item: _items[index],
      inFavorites: _items[index].isFavourite,
      onFavoriteButtonPressed: (item) {
        setState(() {
          _items[index] = _items[index].copyWith(
            isFavourite: !_items[index].isFavourite,
          );
        });
      },
      onTap: (item) {
        Navigator.of(context).pushNamed(DETAIL);
      },
    );
  }
}
