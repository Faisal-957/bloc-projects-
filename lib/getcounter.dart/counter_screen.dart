import 'package:bloc_state_managemnet/getcounter.dart/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class CounterScreen extends StatelessWidget {
  final controller = Get.put(CounterController());

  CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),

      body: Center(
        child: GetBuilder<CounterController>(
          builder: (controller) {
            return Text(
              "count=${controller.count}",
              style: TextStyle(fontSize: 30),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
