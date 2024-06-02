import 'package:flutter/material.dart';

class ErrorTitleWidget extends StatelessWidget {
  final String message;
  const ErrorTitleWidget({
    super.key, required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message,style: Theme.of(context).textTheme.titleMedium,));
  }
}
