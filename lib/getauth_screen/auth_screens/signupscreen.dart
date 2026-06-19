import 'package:bloc_state_managemnet/auth_page/signup_page.dart';
import 'package:bloc_state_managemnet/getauth_screen/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final controller = Get.find<AuthController>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "Create Account",

                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 30),

              TextField(
                controller: nameController,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),

                  labelText: "Name",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              SizedBox(height: 15),

              TextField(
                controller: emailController,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),

                  labelText: "Email",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              SizedBox(height: 15),

              TextField(
                controller: passwordController,

                obscureText: true,

                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),

                  labelText: "Password",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              SizedBox(height: 25),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    controller.signup(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  },
                  child: Text("Signup"),
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Already have account?"),

                  TextButton(
                    onPressed: () {
                      Get.back();
                    },

                    child: Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
