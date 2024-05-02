import 'package:flutter_bloc/flutter_bloc.dart';

part 'example_event.dart';
part 'example_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementEvent>(_onIncrement);
    on<DecrementEvent>(_onDecrement);
    on<ChangeUserEvent>(_onChangeUser);
    on<ResetCounter>(_onReset);
  }

  void _onIncrement(IncrementEvent event, Emitter<CounterState> emit) {
    if (state.count >= 5 && state.currenUser.name != "admin") {
      emit(
        state.copyWith(
          errorMessage:
              "You are not allowed to increment the count more than 5, ${state.currenUser}!",
          hasError: true,
        ),
      );
    } else {
      emit(state.copyWith(count: state.count + 1));
    }
  }

  void _onDecrement(DecrementEvent event, Emitter<CounterState> emit) {
    if (state.count <= 0 && state.currenUser.name != "admin") {
      emit(
        state.copyWith(
          errorMessage:
              "You are not allowed to decrement the count less than 0, ${state.currenUser}!",
          hasError: true,
        ),
      );
    } else {
      emit(state.copyWith(count: state.count - 1));
    }
  }

  void _onChangeUser(ChangeUserEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        currenUser: Users.values
            .firstWhere((element) => element.name == event.userName)));
  }

  _onReset(ResetCounter event, Emitter<CounterState> emit) {
    emit(CounterState.initial());
  }
}
