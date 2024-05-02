part of '../counter_main.dart';

class DropDown extends StatelessWidget {
  const DropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return DropdownButton<String>(
          value: state.currenUser.name,
          items: Users.values.map((user) {
            return DropdownMenuItem(
              value: user.name,
              child: Text(user.name),
            );
          }).toList(),
          onChanged: (value) => context.read<CounterBloc>().add(
                ChangeUserEvent(value!),
              ),
        );
      },
    );
  }
}
