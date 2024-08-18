import 'package:flutter/material.dart';
import 'package:guptha_ui_kit/guptha_ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      builder: GkOverlayManager.transitionBuilder(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Helper().showCustomLoader();
        Future.delayed(const Duration(seconds: 5), () {
          Helper().hideLoader();
        });
      }),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GkTextFormField(
              controller: TextEditingController(),
              isPassword: true,
              width: 300,
              label: "Password",
            )
          ],
        ),
      ),
    );
  }
}

class Helper extends GkHelper {
  showCustomLoader() {
    showLoader();
  }
}
