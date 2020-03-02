import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'demo_counter_bloc_provider/count_bloc.dart';
import 'demo_counter_bloc_provider/ui_counter_bloc_provider.dart';

void main() => runApp(CounterBlocProviderApp());

class CounterBlocProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
        creator: (_context, _bag) => CounterBloc(),
        child: CounterBlocProviderPage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

