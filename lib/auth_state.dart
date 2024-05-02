import 'package:auth_repo/auth_repo.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState({required this.user, this.secondsBeforeLogout});

  final int? secondsBeforeLogout;

  final User? user;

  @override
  List<Object?> get props => [user, secondsBeforeLogout];

  AuthState copyWith({
    User? user,
    int? secondsBeforeLogout,
  }) {
    return AuthState(
      user: user == null ? null : this.user,
      secondsBeforeLogout: secondsBeforeLogout ?? this.secondsBeforeLogout,
    );
  }
}
