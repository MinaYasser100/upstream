import 'package:flutter/material.dart';
import 'package:upstream/core/utils/colors.dart';

import 'drawer_content_view.dart';

class HomeDrawerView extends StatelessWidget {
  const HomeDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorsTheme().gradientStart.withValues(alpha: 0.95),
              ColorsTheme().gradientEnd.withValues(alpha: 0.95),
            ],
            stops: const [0.0, 1.0],
          ),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsTheme().primaryDark.withValues(alpha: 0.3),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(-4, 0),
            ),
          ],
        ),
        child: DrawerContentView(),
      ),
    );
  }
}
