import 'package:flutter/material.dart';
import 'package:cinescore/tela_login.dart';

void main() {
  runApp(FazerLogin());
}

class FazerLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineScore',
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }
}
