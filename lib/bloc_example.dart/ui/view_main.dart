import 'package:bloc_demo/bloc_example.dart/bloc/example_bloc.dart';
import 'package:bloc_demo/bloc_example.dart/ui/counter_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlocCounter extends StatelessWidget {
  const BlocCounter({super.key});

  Future<void> showErrorPopup(BuildContext context, String message) async {
    await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Bloc Counter"),
          ),
          body: BlocListener<CounterBloc, CounterState>(
            listenWhen: (previous, current) =>
                previous.hasError != current.hasError &&
                current.errorMessage != null,
            listener: (context, state) {
              showErrorPopup(context, state.errorMessage!).then(
                  (value) => context.read<CounterBloc>().add(const ResetCounter()));
            },
            child: const CounterMain(),
          )),
    );
  }
}
