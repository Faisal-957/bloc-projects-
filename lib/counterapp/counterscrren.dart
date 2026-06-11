import 'package:bloc_state_managemnet/counterapp/bloc.dart';
import 'package:bloc_state_managemnet/counterapp/event.dart';
import 'package:bloc_state_managemnet/counterapp/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterblocc = context.read<Counterbloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('My App')),
      body: Center(
        child: BlocBuilder<Counterbloc, CounterState>(
          builder: (context, value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Counter Value: ${value.counterValue}',
                  style: const TextStyle(fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        counterblocc.add(Plus());
                      },
                      child: Text("Increment"),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        counterblocc.add(Minus());
                      },
                      child: Text("Decrement"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
