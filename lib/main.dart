import 'package:auth_repo/auth_repo.dart';
import 'package:bloc_demo/auth_cubit.dart';
import 'package:bloc_demo/auth_state.dart';
import 'package:bloc_demo/bloc_example.dart/ui/view_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final authRepo = AuthenticationRepository();
  runApp(MyApp(
    authRepo: authRepo,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.authRepo});

  final AuthenticationRepository authRepo;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  AuthApp(authRepo: authRepo),
    );
  }
}



class AuthApp extends StatelessWidget {
  const AuthApp({super.key, required this.authRepo});
 final AuthenticationRepository authRepo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: authRepo,
        child: BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(authRepo: authRepo),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.user == null) {
                Navigator.of(context).push(LogoutScreen.route());
              }
            },
            child: const BlocCounter(),
          ),
        ));
  }

}
class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LogoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("you are now logged out!!")),
    );
  }
}