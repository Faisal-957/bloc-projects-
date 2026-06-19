import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  int count = 0;
  void increment() {
    count++;
    update();
  }
}
