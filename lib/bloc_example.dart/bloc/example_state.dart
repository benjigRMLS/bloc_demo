
part of 'example_bloc.dart';

enum Users {
  benji,
  admin,
}

final class CounterState {
  CounterState({
    required this.count,
    required this.currenUser,
    required this.hasError,
    this.errorMessage,
  });

  final int count;
  final Users currenUser;
  final bool hasError;
  final String? errorMessage;

  CounterState copyWith({
    int? count,
    Users? currenUser,
    bool? hasError,
    String? errorMessage,
  }) {
    return CounterState(
      count: count ?? this.count,
      currenUser: currenUser ?? this.currenUser,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  CounterState.initial() :
    count = 0,
    currenUser = Users.benji,
    errorMessage = null,
    hasError = false;
}
