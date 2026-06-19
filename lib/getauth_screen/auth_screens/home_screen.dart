import 'package:bloc_state_managemnet/getauth_screen/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(Icons.home, size: 100),

            SizedBox(height: 20),

            Text(
              "Welcome Home",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Get.snackbar("Welcome", "You are on Home Screen");
              },

              child: Text("Click Me"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                controller.logout();
              },
              child: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
