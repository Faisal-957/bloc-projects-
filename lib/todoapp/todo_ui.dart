import 'package:bloc_state_managemnet/todoapp/bloc.dart';
import 'package:bloc_state_managemnet/todoapp/event.dart';
import 'package:bloc_state_managemnet/todoapp/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  final controller = TextEditingController();

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App")),

      body: Column(
        children: [
          // INPUT
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: "Enter todo"),
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    context.read<TodoBloc>().add(Todo(controller.text));
                    controller.clear();
                  },
                ),
              ],
            ),
          ),

          // LIST
          Expanded(
            child: BlocBuilder<TodoBloc, Todostate>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];

                    return ListTile(title: Text(todo));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
