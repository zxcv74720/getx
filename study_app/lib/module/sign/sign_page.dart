import 'package:flutter/material.dart';
import 'package:study_app/module/sign/sign_controller.dart';

class SignPage extends StatelessWidget {
  const SignPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignController.to;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Sign Page'),
          TextField(
            keyboardType: TextInputType.number,
            controller: controller.idTextController,
          ),
          ElevatedButton(
            onPressed: () {
              controller.login();
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
