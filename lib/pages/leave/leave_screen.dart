import 'package:flutter/material.dart';

class LeaveScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const LeaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leave')),
      body: const Center(child: Text('This is the Leave Screen')),
    );
  }
}
