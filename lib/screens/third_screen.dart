import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test/controllers/tap_controller.dart';
import 'package:getx_test/screens/home_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TapController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get-x',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Text(
            'Counter : ${controller.counter}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Get.offAll(() => const HomeScreen());
            },
            child: const Text('Home'),
          ),
        ],
      ),
    );
  }
}
