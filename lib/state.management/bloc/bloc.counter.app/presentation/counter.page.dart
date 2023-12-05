import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter.cubit.dart';
import 'inc.dec.page.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key, required this.title});

  final String title;

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
                bloc: counterCubit,
                builder: (context, counter) {
                  return Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "btn 1",
            onPressed: counterCubit.increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "btn 2",
            onPressed: counterCubit.decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
          FloatingActionButton(
            heroTag: "btn 3",
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const IncrementDecrementPage()));
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
