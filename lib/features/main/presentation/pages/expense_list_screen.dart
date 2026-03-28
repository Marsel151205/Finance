import 'package:flutter/material.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemCount: 10, itemBuilder: (context, index) {
        final item = '';
      }),
    );
  }
}
