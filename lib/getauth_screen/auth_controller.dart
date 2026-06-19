import 'package:bloc_state_managemnet/getauth_screen/auth_screens/home_screen.dart';
import 'package:bloc_state_managemnet/getauth_screen/auth_screens/login_screen.dart';
import 'package:bloc_state_managemnet/getauth_screen/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Auth authService = Get.find<Auth>();

  var loading = false.obs;

  // Signup

  Future<void> signup(String email, String password) async {
    try {
      loading.value = true;

      await authService.signup(email, password);

      Get.snackbar("Success", "Account Created");

      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loading.value = false;
    }
  }

  // Login

  Future<void> login(String email, String password) async {
    try {
      loading.value = true;

      await authService.login(email, password);

      Get.snackbar("Success", "Login Successful");

      Get.offAll(HomeScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loading.value = false;
    }
  }

  // Logout
  Future<void> logout() async {
    await authService.logout();

    Get.offAll(LoginScreen());
  }
}
