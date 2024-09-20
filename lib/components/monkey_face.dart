import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MonkeyFace extends StatelessWidget {
  final double eyeOpenness;

  const MonkeyFace({Key? key, required this.eyeOpenness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      _buildSvgString(),
      width: 200,
      height: 200,
    );
  }

 
  String _buildSvgString() {
    // Hands move inward as handPosition increases
    double leftHandX = 15.7 + (5 * eyeOpenness);
    double rightHandX = 48.3 - (5 * eyeOpenness);
    // Eyes shrink as handPosition increases
    double eyeHeight = 5 - (3 * eyeOpenness);
    return '''
    <svg viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
      <circle cx="53.8" cy="33" fill="#89664c" r="8.2"/>
      <circle cx="53.8" cy="33" fill="#ffc5d3" r="5.4"/>
      <circle cx="10.2" cy="33" fill="#89664c" r="8.2"/>
      <circle cx="10.2" cy="33" fill="#ffc5d3" r="5.4"/>
      <path d="M55.3 27.6C55.3 17.9 44.9 10 32 10S8.7 17.9 8.7 27.6c0 2.3.6 4.4 1.6 6.4c-1 2-1.6 4.2-1.6 6.4C8.7 50.1 19.1 58 32 58s23.3-7.9 23.3-17.6c0-2.3-.6-4.4-1.6-6.4c1-2 1.6-4.2 1.6-6.4" fill="#89664c"/>
      <path d="M52 28.2c0-16.9-20-6.1-20-6.1s-20-10.8-20 6.1c0 4.7 2.9 9 7.5 11.7c-1.3 1.7-2.1 3.6-2.1 5.7c0 6.1 6.6 11 14.7 11s14.7-4.9 14.7-11c0-2.1-.8-4-2.1-5.7c4.4-2.7 7.3-7 7.3-11.7" fill="#e0ac7e"/>
      <ellipse cx="24" cy="38.7" rx="4" ry="${eyeHeight}" fill="#3b302a"/>
      <ellipse cx="40" cy="38.7" rx="4" ry="${eyeHeight}" fill="#3b302a"/>
      <ellipse cx="32" cy="48" rx="4.5" ry="2.7" fill="#3b302a"/>
      <path d="M${leftHandX} 24.9s4.9-4.5 9.5-3.9c2.3.3-7.1 7.6-7.1 7.6s9.7-8.2 11.7-5.6c1.8 2.3-8.9 9.8-8.9 9.8s10-8.1 9.6-4.6C${leftHandX + 14.5} 32 ${leftHandX + 6.9} 41 ${leftHandX + 2.3} 42c-6.6 1.3-11.8-2.9-8.3-17.5c1.8-7.4 3.5.8 6 .4" fill="#ffd6bb"/>
      <path d="M${rightHandX} 24.9s-4.9-4.5-9.5-3.9c-2.3.3 7.1 7.6 7.1 7.6s-9.7-8.2-11.7-5.6c-1.8 2.3 8.9 9.8 8.9 9.8s-10-8.1-9.7-4.6C${rightHandX - 14.5} 32 ${rightHandX - 6.9} 41 ${rightHandX - 2.3} 42c6.6 1.3 11.8-2.9 8.3-17.5c-1.8-7.4-3.5.8-6 .4" fill="#ffd6bb"/>
    </svg>
    ''';
  }
}
