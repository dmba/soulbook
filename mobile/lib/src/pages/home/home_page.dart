import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/src/pages/login/auth.dart';
import 'package:mobile/src/utils/state_mixin.dart';

class HomePage extends StatefulWidget {
  HomePage(this._bloc, this._auth) : super();

  final CounterBloc _bloc;
  final Auth _auth;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with StateMixin {
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
      body: BlocBuilder<CounterEvent, CounterState>(
        bloc: widget._bloc,
        builder: _counterBuilder,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleSignIn,
        tooltip: strings.fabTooltip,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _counterBuilder(BuildContext context, CounterState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            strings.infoMessage,
          ),
          Text(
            '${state.value}',
            style: themeData.textTheme.display1,
          ),
        ],
      ),
    );
  }

  void _handleSignIn() async {
    final user = await widget._auth.signInWithGoogle();
    print(user);
  }
}
