import 'package:flutter/material.dart';
import 'package:redact/auth/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> welcomePages = [
    {
      'title': 'Welcome to Redact',
      'description': 'Secure your files and share with confidence.',
      'image': 'assets/welcome1.png',
    },
    {
      'title': 'Redact Sensitive Information',
      'description': 'Easily remove sensitive data from your files.',
      'image': 'assets/welcome2.png',
    },
    {
      'title': 'Share Safely',
      'description': 'Share your redacted files without worry.',
      'image': 'assets/welcome4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: welcomePages.length,
            itemBuilder: (context, index) {
              return buildWelcomePage(
                welcomePages[index]['title']!,
                welcomePages[index]['description']!,
                welcomePages[index]['image']!,
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    welcomePages.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                SizedBox(height: 20),
                if (_currentPage == welcomePages.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Get Started', style: TextStyle(color: Colors.white)),
            
                  ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    const url = 'https://yourblog.com/how-redact-works';
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  child: Text('Learn how it works'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWelcomePage(String title, String description, String imagePath) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 300),
          SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Theme.of(context).primaryColor
            : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}