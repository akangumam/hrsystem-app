import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
      body: const Center(child: Text('This is the Messages Screen')),
    );
  }
}
