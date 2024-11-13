import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_roll/gradient_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Change App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 6, 175, 175),
          Color.fromARGB(255, 104, 149, 21),
        ),
      ),
    );
  }
}
