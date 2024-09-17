import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Color(0xFF16213E),
      ),
      body: Center(
        child: Text(
          'History Page',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      backgroundColor: Color(0xFF1A1A2E),
    );
  }
}