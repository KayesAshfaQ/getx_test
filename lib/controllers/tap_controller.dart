// ignore_for_file: avoid_print

import 'package:get/get.dart';

class TapController extends GetxController {
  int _counter = 0;
  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    update();
  }

  void increment() {
    _counter++;
    print('increment: $_counter');
    update();
  }

  void decrement() {
    _counter--;
    print('decrement: $_counter');
    update();
  }
}
