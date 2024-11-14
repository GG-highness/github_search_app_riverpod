import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../common/enum/page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go(AppPage.home.path);
          },
          child: const Text('Go to Home Page'),
        ),
      ),
    );
  }
}
