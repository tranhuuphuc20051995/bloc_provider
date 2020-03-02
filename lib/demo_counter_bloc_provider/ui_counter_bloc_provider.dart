import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'count_bloc.dart';

class CounterBlocProviderPage extends StatefulWidget {
  CounterBlocProviderPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CounterBlocProviderPageState createState() => _CounterBlocProviderPageState();
}

class _CounterBlocProviderPageState extends State<CounterBlocProviderPage> {
  CounterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CounterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder <int>(
              stream: bloc.count,
              initialData: bloc.count.value,
              builder:(context, snap) => Text(
                '${snap.data}',
                style: Theme
                    .of(context)
                    .textTheme
                    .display1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.incrementCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}