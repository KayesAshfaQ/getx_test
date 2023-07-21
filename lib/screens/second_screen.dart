import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tap_controller.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    // find the TapController instance
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
            Text(
              'Second Screen',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Divider(height: 16),
            ),
            GetBuilder<TapController>(builder: (_) {
              return Text(
                'Count: ${controller.counter}',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              );
            }),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.counter += 5;
              },
              child: const Text('ADD 5'),
            )
          ],
        ));
  }
}
