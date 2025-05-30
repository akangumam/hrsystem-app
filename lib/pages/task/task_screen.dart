import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task')),
      body: const Center(child: Text('This is the Task Screen')),
    );
  }
}
