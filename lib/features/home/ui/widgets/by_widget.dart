import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';

class ByWidget extends StatelessWidget {
  const ByWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'By Mina Yasser',
                style: AppTextStyles.styleBold16sp(
                  context,
                ).copyWith(color: ColorsTheme().whiteColor),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              Text(
                '01159091340',
                style: AppTextStyles.styleBold16sp(
                  context,
                ).copyWith(color: ColorsTheme().whiteColor),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
