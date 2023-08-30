import 'package:flutter/material.dart';

// Create a class HomeError that extends StatelessWidget
class HomeError extends StatelessWidget {
  const HomeError({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(error)),
    );
  }
}
