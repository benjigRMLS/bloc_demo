
part of 'example_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class IncrementEvent implements CounterEvent {
  const IncrementEvent();
}

class DecrementEvent implements CounterEvent {
  const DecrementEvent();
}

class ChangeUserEvent implements CounterEvent {
  final String userName;

  const ChangeUserEvent(this.userName);
}

class ResetCounter implements CounterEvent {
  const ResetCounter();
}