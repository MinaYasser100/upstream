import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/features/book/data/model/study_model.dart';

class BookStudyItemView extends StatelessWidget {
  const BookStudyItemView({
    super.key,
    required this.study,
    required this.index,
  });

  final Study study;
  final int index;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 600 + (index * 100)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                color: ColorsTheme().cardColor,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: ColorsTheme().whiteColor.withValues(alpha: .2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorsTheme().primaryDark.withValues(alpha: 0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.bookmark,
                          color: ColorsTheme().accentColor,
                          size: 24.sp,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                study.day,
                                textStyle: AppTextStyles.styleBold28sp(context)
                                    .copyWith(
                                      color: ColorsTheme().primaryColor,
                                      shadows: [
                                        Shadow(
                                          color: ColorsTheme().primaryDark
                                              .withValues(alpha: .3),
                                          blurRadius: 4,
                                          offset: const Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                textAlign: TextAlign.right,
                                speed: const Duration(milliseconds: 150),
                              ),
                            ],
                            totalRepeatCount: 1,
                            isRepeatingAnimation: false,
                            pause: Duration.zero,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // نص الدراسة
                    Text(
                      study.text,
                      style: AppTextStyles.styleRegular20sp(context).copyWith(
                        color: ColorsTheme().primaryDark.withValues(alpha: .9),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
