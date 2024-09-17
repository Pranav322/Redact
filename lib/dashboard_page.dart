import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? _fileName;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          _fileName = result.files.single.name;
        });
        // You can access the file path using: result.files.single.path
        // This is where you would handle the file (e.g., upload, process, etc.)
      } else {
        // User canceled the picker
      }
    } catch (e) {
      print('Error picking file: $e');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking file. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color(0xFF16213E),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xFF0F3460),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFE94560), width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload,
                    size: 60,
                    color: Color(0xFFE94560),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _fileName ?? 'No file selected',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _pickFile,
                    child: Text('Choose File'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE94560),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE94560),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF1A1A2E),
    );
  }
}