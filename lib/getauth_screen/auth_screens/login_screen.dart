import 'package:bloc_state_managemnet/auth_page/signup_page.dart';
import 'package:bloc_state_managemnet/getauth_screen/auth_controller.dart';
import 'package:bloc_state_managemnet/getauth_screen/auth_screens/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(AuthController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 30),

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

              SizedBox(height: 20),

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

                child: Obx(() {
                  return ElevatedButton(
                    onPressed: controller.loading.value
                        ? null
                        : () {
                            controller.login(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                    child: controller.loading.value
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text("Login"),
                  );
                }),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Don't have account?"),

                  TextButton(
                    onPressed: () {
                      Get.to(SignupScreen());
                    },

                    child: Text("Signup"),
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
