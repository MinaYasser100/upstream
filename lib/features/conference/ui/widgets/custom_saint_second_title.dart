import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';

class CustomSanitSecondTitle extends StatelessWidget {
  const CustomSanitSecondTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'الأنبا موسى الأسود',
            textStyle: AppTextStyles.styleBold32sp(context).copyWith(
              color: ColorsTheme().whiteColor,
              shadows: [
                Shadow(
                  color: ColorsTheme().primaryDark.withValues(alpha: .4),
                  blurRadius: 6,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            textAlign: TextAlign.center,
            speed: const Duration(milliseconds: 150),
          ),
        ],
        totalRepeatCount: 1,
        isRepeatingAnimation: false,
        pause: Duration.zero,
      ),
    );
  }
}
