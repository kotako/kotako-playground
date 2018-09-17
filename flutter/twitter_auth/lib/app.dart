import 'package:flutter/material.dart';
import 'package:twitter_auth/pages/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    MaterialApp(
      title: 'Twitter Auth Sample',
      home: LoginScreen(),
    );
}
