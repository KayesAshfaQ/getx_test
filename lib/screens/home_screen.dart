import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tap_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // dependency injection
    // initialize the controller
    final controller = Get.put(TapController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get-x',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: () {
                // when counter is already 0, show snackbar and return
                if (controller.counter == 0) {
                  // show snackbar
                  showSnackbar(context);

                  return;
                }
                controller.decrement();
              },
              icon: const Icon(Icons.remove),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
            const SizedBox(width: 16),
            GetBuilder<TapController>(
              builder: (controller) {
                return Text(
                  controller.counter.toString(),
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            ),
            const SizedBox(width: 16),
            IconButton.filled(
              onPressed: () {
                controller.increment();
              },
              icon: const Icon(Icons.add),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // show error snackbar
  void showSnackbar(BuildContext context) {
    // create snackbar
    SnackBar snackbar = SnackBar(
      content: Text(
        'Counter cannot be less than 0',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            ),
      ),
      backgroundColor: Colors.red,
      duration: const Duration(milliseconds: 1500),
      action: SnackBarAction(
        label: 'close',
        textColor: Colors.grey[200],
        onPressed: () {
          // hide snackbar
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    // show snackbar and remove if any other snackbar is in queue after it is closed
    ScaffoldMessenger.of(context)
        .showSnackBar(snackbar)
        .closed
        .then((value) => ScaffoldMessenger.of(context).clearSnackBars());
  }
}
