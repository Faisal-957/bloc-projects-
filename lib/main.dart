import 'package:bloc_state_managemnet/auth_page/auth_service.dart';
import 'package:bloc_state_managemnet/auth_page/bloc/bloc_.dart';
import 'package:bloc_state_managemnet/auth_page/login_page.dart';
import 'package:bloc_state_managemnet/counterapp/bloc.dart';
import 'package:bloc_state_managemnet/firebase_options.dart';
import 'package:bloc_state_managemnet/noteaap/noteapp_bloc.dart';
import 'package:bloc_state_managemnet/noteaap/noteshow_screen.dart';
import 'package:bloc_state_managemnet/todoapp/bloc.dart';
import 'package:bloc_state_managemnet/todoapp/event.dart';
import 'package:bloc_state_managemnet/todoapp/todo_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<Authbloc>(
          // ✅ ADD THIS
          create: (context) => Authbloc(AuthService()),
        ),
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
      home: LoginPage(),
    );
  }
}
