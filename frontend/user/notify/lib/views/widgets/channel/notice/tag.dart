import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String value;
  const Tag({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).canvasColor,
        border: Border.all(width: 1, color: Colors.black38),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        child: Text(value),
      ),
    );
  }
}
