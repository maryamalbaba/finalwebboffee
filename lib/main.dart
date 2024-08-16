import 'package:bofweb/core/config/options.dart';
import 'package:bofweb/view/Navigation.dart';
import 'package:bofweb/view/auth/login.dart';
import 'package:flutter/material.dart';

//import 'package:hello/view/auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage(),
      // pref!.getString('token') == null ? LoginPage() : SideMenue(),
    );
  }
}
