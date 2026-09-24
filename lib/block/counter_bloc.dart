import 'package:bloc_example_project/block/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<CounterStates> {
  CounterBloc() : super(const CounterState(0));

  void incrementCounter() {
    final currentState = state as CounterState;
    emit(CounterState(currentState.counter + 1));
  }

  void decrementCounter() {
    final currentState = state as CounterState;
    emit(CounterState(currentState.counter - 1));
  }
}
