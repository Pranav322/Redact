import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonkeyFace extends StatelessWidget {
  final double eyeOpenness;

  const MonkeyFace({Key? key, this.eyeOpenness = 1.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      _buildSvgString(),
      width: 200,
      height: 200,
    );
  }

  String _buildSvgString() {
    double eyeHeight = 10 * eyeOpenness;

    return '''
    <svg width="200" height="200" viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
      <!-- Background circle -->
      <circle cx="100" cy="100" r="100" fill="lightgrey"/>
      
      <!-- Monkey face -->
      <path d="M50,140 Q40,80 100,70 Q160,80 150,140 Z" fill="#a38360" stroke="#6d4c41" stroke-width="3"/>
      
      <!-- Monkey snout -->
      <ellipse cx="100" cy="120" rx="50" ry="40" fill="#d8b597" stroke="#6d4c41" stroke-width="3"/>

      <!-- Left eye -->
      <ellipse cx="75" cy="100" rx="10" ry="${eyeHeight}" fill="black"/>
      
      <!-- Right eye -->
      <ellipse cx="125" cy="100" rx="10" ry="${eyeHeight}" fill="black"/>

      <!-- Left eye shine -->
      <circle cx="72" cy="95" r="3" fill="white"/>
      
      <!-- Right eye shine -->
      <circle cx="122" cy="95" r="3" fill="white"/>
      
      <!-- Nose -->
      <ellipse cx="100" cy="130" rx="7" ry="5" fill="#6d4c41"/>
      
      <!-- Mouth -->
      <path d="M80 145 Q100 160 120 145" stroke="black" stroke-width="3" fill="none" stroke-linecap="round"/>

      <!-- Left ear -->
      <circle cx="45" cy="90" r="20" fill="#a38360" stroke="#6d4c41" stroke-width="3"/>
      <circle cx="45" cy="90" r="15" fill="#d8b597" stroke="#6d4c41" stroke-width="2"/>

      <!-- Right ear -->
      <circle cx="155" cy="90" r="20" fill="#a38360" stroke="#6d4c41" stroke-width="3"/>
      <circle cx="155" cy="90" r="15" fill="#d8b597" stroke="#6d4c41" stroke-width="2"/>
      
    </svg>
    ''';
  }
}
