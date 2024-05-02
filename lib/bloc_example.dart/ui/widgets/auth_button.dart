import 'package:bloc_demo/auth_cubit.dart';
import 'package:bloc_demo/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => context.read<AuthCubit>().startLogoutTimer(5),
          child: state.secondsBeforeLogout == null
              ? const Text("Start Logout!!")
              : Text(state.secondsBeforeLogout.toString()),
        );
      },
    );
  }
}
