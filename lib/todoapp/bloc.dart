import 'package:bloc_state_managemnet/todoapp/event.dart';
import 'package:bloc_state_managemnet/todoapp/state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<Todoevent, Todostate> {
  TodoBloc() : super(Todostate(todos: [])) {
    on<Todo>((event, emit) {
      final updated = List<String>.from(state.todos);
      updated.add(event.title);
      emit(Todostate(todos: updated));
    });
  }
}
