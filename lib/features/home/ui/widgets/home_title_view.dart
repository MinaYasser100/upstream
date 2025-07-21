import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';

class HomeTitleView extends StatelessWidget {
  const HomeTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Text(
              'جدول المؤتمر',
              style: AppTextStyles.styleBold28sp(context).copyWith(
                color: ColorsTheme().whiteColor,
                shadows: [
                  Shadow(
                    color: ColorsTheme().primaryDark.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 12.h),
            Container(
              height: 30.h, // ارتفاع النص المتحرك
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ClipRect(
                child: Marquee(
                  text:
                      'وَلاَ تُشَاكِلُوا هذَا الدَّهْرَ، بَلْ تَغَيَّرُوا عَنْ شَكْلِكُمْ بِتَجْدِيدِ أَذْهَانِكُمْ،. (رو 12: 2)',
                  style: AppTextStyles.styleRegular16sp(context).copyWith(
                    color: ColorsTheme().whiteColor,
                    shadows: [
                      Shadow(
                        color: ColorsTheme().primaryDark.withValues(alpha: 0.5),
                        blurRadius: 2,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  blankSpace: 20.0, // مسافة بين تكرارات النص
                  velocity: 50.0, // سرعة الحركة (بكسل/ثانية)
                  pauseAfterRound: const Duration(
                    seconds: 1,
                  ), // توقف لثانية بعد كل دورة
                  textDirection: TextDirection.rtl, // اتجاه النص
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
