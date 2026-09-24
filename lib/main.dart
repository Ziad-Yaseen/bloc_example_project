import 'dart:developer';

import 'package:bloc_example_project/block/counter_bloc.dart';
import 'package:bloc_example_project/block/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => CounterBloc(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            // BlocBuilder<CounterBloc, CounterStates>(
            //   builder: (context, state) {
            //     final currentState = state as CounterState;
            //     return Text(
            //       currentState.counter.toString(),
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),

            // BlocListener<CounterBloc, CounterStates>(
            //   listener: (context, state) {
            //     if (state is CounterState) {
            //       log('State changed with value ${state.counter}');
            //     }
            //   },
            //   child: const SizedBox(),
            // ),
            BlocConsumer<CounterBloc, CounterStates>(
              listener: (context, state) {
                if (state is CounterState) {
                  log('State changed with value ${state.counter}');
                  if (state.counter > 5) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Counter Is greater than 5'),
                      ),
                    );
                  }
                }
              },

              builder: (context, state) {
                final currentState = state as CounterState;
                return Text(
                  currentState.counter.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),

            const SizedBox(height: 200),
            TextButton(
              onPressed: () {
                context.read<CounterBloc>().decrementCounter();
              },
              child: const Text('Decrement'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
