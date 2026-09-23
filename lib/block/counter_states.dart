import 'package:equatable/equatable.dart';

abstract class CounterStates extends Equatable {
  const CounterStates();

  @override
  List<Object?> get props => [];
}

class CounterState extends CounterStates {
  final int counter;
  const CounterState(this.counter);
}