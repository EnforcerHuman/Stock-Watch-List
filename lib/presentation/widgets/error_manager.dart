import 'package:flutter/material.dart';

class ErrorManager extends StatelessWidget {
  final String errorMessage;
  const ErrorManager({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
