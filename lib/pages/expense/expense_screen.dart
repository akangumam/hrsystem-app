import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense')),
      body: const Center(child: Text('This is the Expense Screen')),
    );
  }
}
