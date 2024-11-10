import 'package:flutter/material.dart';

/// Widget pel Scaffold principal de l'aplicació
class MainScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const MainScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: body,
    );
  }
}
