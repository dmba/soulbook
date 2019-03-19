import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soulbook/src/blocs/home/home.dart';
import 'package:soulbook/src/model/menu_item.dart';
import 'package:soulbook/src/utils/state_mixin.dart';
import 'package:soulbook/src/widgets/menu_widget.dart';
import 'package:soulbook/src/widgets/paragraph_card.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  HomePage(this._bloc) : super();

  final CounterBloc _bloc;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with StateMixin {
  static final uuid = Uuid();
  ScrollController _scrollController;

  List<ParagraphItem> _items = <ParagraphItem>[
    ParagraphItem(
      uuid.v1(),
      "Блок 1",
      "Знакомство",
      "TASK_DETAILS",
      "assets/block1.png",
    ),
    ParagraphItem(
      uuid.v1(),
      "Блок 2",
      "В поисках внутренних ресурсов",
      "TASK_DETAILS",
      "assets/block2.png",
    ),
    ParagraphItem(
      uuid.v1(),
      "Блок 3",
      "Архетипы внутренней семьи",
      "TASK_DETAILS",
      "assets/block3.png",
    ),
    ParagraphItem(
      uuid.v1(),
      "Блок 4",
      "Счастливая Я",
      "TASK_DETAILS",
      "assets/block4.png",
    ),
    ParagraphItem(
      uuid.v1(),
      "Блок 5",
      "Мир отношений",
      "TASK_DETAILS",
      "assets/block5.png",
    ),
  ];

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
        accountName: "Dmytro Babiienko",
        accountEmail: "dmytro.babiienko@gmail.com",
        accountAvatar:
            "https://lh6.googleusercontent.com/-DGh7XBoUXPA/AAAAAAAAAAI/AAAAAAAAABE/x4XAorr5s5o/s96-c/photo.jpg",
        menuItems: _items,
      ),
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
      inFavorites: false,
      onFavoriteButtonPressed: () {},
    );
  }
}
