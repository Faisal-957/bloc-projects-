import 'package:bloc_state_managemnet/auth_page/auth_service.dart';
import 'package:bloc_state_managemnet/auth_page/bloc/bloc_.dart';
import 'package:bloc_state_managemnet/auth_page/login_page.dart';
import 'package:bloc_state_managemnet/counterapp/bloc.dart';
import 'package:bloc_state_managemnet/firebase_options.dart';
import 'package:bloc_state_managemnet/getauth_screen/auth_controller.dart';
import 'package:bloc_state_managemnet/getauth_screen/auth_screens/login_screen.dart';
import 'package:bloc_state_managemnet/getauth_screen/auth_service.dart';
import 'package:bloc_state_managemnet/getcounter.dart/counter_screen.dart';
import 'package:bloc_state_managemnet/noteaap/noteapp_bloc.dart';
import 'package:bloc_state_managemnet/noteaap/noteshow_screen.dart';
import 'package:bloc_state_managemnet/todoapp/bloc.dart';
import 'package:bloc_state_managemnet/todoapp/event.dart';
import 'package:bloc_state_managemnet/todoapp/todo_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(Auth());
  Get.put(AuthController());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<Authbloc>(create: (context) => Authbloc(AuthService())),
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}
