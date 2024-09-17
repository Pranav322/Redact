import 'package:flutter/material.dart';

class KeysPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keys'),
        backgroundColor: Color(0xFF16213E),
      ),
      body: Center(
        child: Text(
          'Keys Page',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xFF1A1A2E),
    );
  }
}