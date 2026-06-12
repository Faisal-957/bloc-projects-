import 'package:bloc_state_managemnet/auth_page/bloc/bloc_.dart';
import 'package:bloc_state_managemnet/auth_page/bloc/event.dart';
import 'package:bloc_state_managemnet/auth_page/bloc/state.dart';
import 'package:bloc_state_managemnet/auth_page/signup_page.dart';
import 'package:bloc_state_managemnet/noteaap/noteapp_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup screen")),
      body: BlocConsumer<Authbloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => NotepadScreen()),
            );
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("you are logged in")));
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Login Page",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hint: Text('Email'),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hint: Text('Password'),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text("Dont have an Account"),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<Authbloc>().add(
                      Loginevent(emailController.text, passwordController.text),
                    );
                  },
                  child: Text("login"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
