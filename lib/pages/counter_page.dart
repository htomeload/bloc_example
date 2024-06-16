import 'package:bloc_example/bloc/counter_bloc.dart';
import 'package:bloc_example/bloc/counter_event.dart';
import 'package:bloc_example/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App Bloc"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Text(
              state.value.toString(),
              style: const TextStyle(
                fontSize: 40.0,
              ),
            ),
          );
        },
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () =>
              BlocProvider.of<CounterBloc>(context).add(Increment()),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          width: 16.0,
        ),
        FloatingActionButton(
          onPressed: () =>
              BlocProvider.of<CounterBloc>(context).add(Decrement()),
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        )
      ],
    );
  }
}
