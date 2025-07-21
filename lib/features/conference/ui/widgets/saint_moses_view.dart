import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/conference/data/conference_data.dart';

class SaintMosesView extends StatelessWidget {
  const SaintMosesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // العنوان الرئيسي
            const CustomTitleView(title: 'شفيع المؤتمر'),
            SliverToBoxAdapter(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'الأنبا موسى الأسود',
                    textStyle: AppTextStyles.styleBold32sp(context).copyWith(
                      color: ColorsTheme().whiteColor,
                      shadows: [
                        Shadow(
                          color: ColorsTheme().primaryDark.withValues(
                            alpha: .4,
                          ),
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
            ),
            // نص السيرة كاملاً في كارت واحد
            SliverToBoxAdapter(
              child: FadeIn(
                duration: const Duration(milliseconds: 600),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: ColorsTheme().cardColor,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: ColorsTheme().whiteColor.withValues(
                              alpha: 0.2,
                            ),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorsTheme().primaryDark.withValues(
                                alpha: 0.2,
                              ),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Text(
                          ConferenceData.biography,
                          style: AppTextStyles.styleRegular16sp(context)
                              .copyWith(
                                color: ColorsTheme().primaryDark,
                                fontWeight: FontWeight.w600,
                                height: 1.7,
                              ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
