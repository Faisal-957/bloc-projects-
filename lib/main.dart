import 'package:bloc_state_managemnet/counterapp/bloc.dart';
import 'package:bloc_state_managemnet/noteaap/noteapp_bloc.dart';
import 'package:bloc_state_managemnet/noteaap/noteshow_screen.dart';
import 'package:bloc_state_managemnet/todoapp/bloc.dart';
import 'package:bloc_state_managemnet/todoapp/event.dart';
import 'package:bloc_state_managemnet/todoapp/todo_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<Counterbloc>(create: (context) => Counterbloc()),
        BlocProvider<TodoBloc>(create: (context) => TodoBloc()),
        BlocProvider<NoteappBloc>(create: (context) => NoteappBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Notehome(),
    );
  }
}
