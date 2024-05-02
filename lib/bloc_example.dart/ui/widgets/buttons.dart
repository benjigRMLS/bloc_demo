part of '../counter_main.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(const IncrementEvent()),
              icon: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(const DecrementEvent()),
              icon: const Icon(Icons.remove),
            ),
          ],
        );
      },
    );
  }
}
