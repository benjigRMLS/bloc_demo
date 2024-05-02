part of '../counter_main.dart';

class CountDisplay extends StatelessWidget {
  const CountDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          state.count.toString(),
          style: const TextStyle(fontSize: 24),
        ),
      );
    });
  }
}
