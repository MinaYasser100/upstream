import 'package:flutter/material.dart';

import 'colors.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorsTheme().gradientStart,
            ColorsTheme().gradientEnd.withValues(alpha: .8),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      child: child,
    );
  }
}
