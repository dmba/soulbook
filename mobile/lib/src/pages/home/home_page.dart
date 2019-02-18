import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/model/menu_item.dart';
import 'package:mobile/src/pages/routes.dart';
import 'package:mobile/src/utils/state_mixin.dart';
import 'package:mobile/src/widgets/card_item_widget.dart';
import 'package:mobile/src/widgets/menu_widget.dart';

class HomePage extends StatefulWidget {
  HomePage(this._bloc) : super();

  final CounterBloc _bloc;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with StateMixin {
  static num _counter = 1;
  ScrollController _scrollController;

  List<MenuItem> _menuItems = <MenuItem>[
    MenuItem(
      "Блок 1",
      "Знакомство",
      "TASK_DETAILS",
    ),
    MenuItem(
      "Блок 2",
      "В поисках внутренних ресурсов",
      "TASK_DETAILS",
    ),
    MenuItem(
      "Блок 3",
      "Архетипы внутренней семьи",
      "TASK_DETAILS",
    ),
    MenuItem(
      "Блок 4",
      "Счастливая Я",
      "TASK_DETAILS",
    ),
    MenuItem(
      "Блок 5",
      "Мир отношений",
      "TASK_DETAILS",
    ),
  ];

  List<MenuItem> _listItems = <MenuItem>[
    MenuItem(
      "Блок 1",
      "Знакомство",
      "TASK_DETAILS",
    ),
    MenuItem(
      "Блок 2",
      "В поисках внутренних ресурсов",
      "TASK_DETAILS",
    ),
    MenuItem(
      "Блок 3",
      "Архетипы внутренней семьи",
      "TASK_DETAILS",
    ),
    MenuItem(
      "Блок 4",
      "Счастливая Я",
      "TASK_DETAILS",
    ),
    MenuItem(
      "Блок 5",
      "Мир отношений",
      "TASK_DETAILS",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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
        accountName: "Dmytro Babiienko",
        accountEmail: "dmytro.babiienko@gmail.com",
        accountAvatar:
            "https://lh6.googleusercontent.com/-DGh7XBoUXPA/AAAAAAAAAAI/AAAAAAAAABE/x4XAorr5s5o/s96-c/photo.jpg",
        menuItems: _menuItems,
        onClick: () => Navigator.of(context).pushNamed(DETAILS),
      ),
      body: BlocBuilder<CounterEvent, CounterState>(
        bloc: widget._bloc,
        builder: _counterBuilder,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'home-fab' + (_counter++).toString(),
        onPressed: _onRefresh,
        tooltip: strings.fabTooltip,
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _counterBuilder(BuildContext context, CounterState state) {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: _buildItem,
      itemCount: _listItems.length,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return CardItemWidget(
      item: _listItems[index],
      onClick: () => Navigator.of(context).pushNamed(DETAILS),
    );
  }

  void _onRefresh() => widget._bloc.increment();
}
