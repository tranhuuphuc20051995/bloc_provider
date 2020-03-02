import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc implements Bloc {
  final _counterController = BehaviorSubject<int>.seeded(0);

  ValueStream<int> get count => _counterController.stream;

  Future<void> incrementCounter() async {
    await _counterController.add(count.value + 1);
  }

  @override
  void dispose() async {
    await _counterController.close();
  }
}
