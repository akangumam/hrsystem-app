import 'package:flutter/material.dart';

class AttendantScreen extends StatelessWidget {
  // ignore: use_super_parameters
  const AttendantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Jangan pakai Scaffold kalau ingin navbar selalu muncul
    // Return konten langsung
    return Center(
      child: Text(
        'Attendant Screen',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
