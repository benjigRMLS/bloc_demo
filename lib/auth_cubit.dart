import 'dart:async';

import 'package:auth_repo/auth_repo.dart';
import 'package:bloc_demo/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required AuthenticationRepository authRepo})
      : _authRepo = authRepo,
        super(AuthState(user: authRepo.currentUser)) {
    _userSubcription = _authRepo.user.listen((event) {
      _logout();
    });
  }

  final AuthenticationRepository _authRepo;
  late final StreamSubscription<User?> _userSubcription;

  Future<void> startLogoutTimer(int delay) async {
    for (int i = delay; i > 0; i--) {
      emit(state.copyWith(secondsBeforeLogout: i, user: state.user));
      await Future.delayed(const Duration(seconds: 1));
    }
    _authRepo.setUser(null);
    return;
  }

  void _logout() {
    emit(state.copyWith(user: null));
 
  }

  @override
  Future<void> close() {
    _userSubcription.cancel();
    _authRepo.dispose();
    return super.close();
  }
}
