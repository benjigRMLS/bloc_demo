import 'package:auth_repo/auth_repo.dart';
import 'package:bloc_demo/bloc_example.dart/ui/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:bloc_demo/bloc_example.dart/bloc/example_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part './widgets/buttons.dart';
part './widgets/count_display.dart';
part './widgets/drop_down.dart';

class CounterMain extends StatelessWidget {
  const CounterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DropDown(),
            const CountDisplay(),
            const Buttons(),
            context.read<AuthenticationRepository?>() != null ? const AuthButton() : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
