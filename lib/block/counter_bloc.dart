import 'package:bloc_example_project/block/counter_events.dart';
import 'package:bloc_example_project/block/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(const CounterState(0)) {
    on<Increment> (_incrementCounter);
    on<Decrement> (_decrementCounter);
  }

  void _incrementCounter(CounterEvents event, Emitter<CounterStates> emit) {
    final currentState = state as CounterState;
    emit(CounterState(currentState.counter + 1));
  }

  void _decrementCounter(CounterEvents event, Emitter<CounterStates> emit) {
    final currentState = state as CounterState;
    emit(CounterState(currentState.counter - 1));
  }
}
