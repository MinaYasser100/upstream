// دالة لبناء عنصر في الـ Drawer
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';

Widget buildAnimatedDrawerItem(
  BuildContext context, {
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return FadeInRight(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: ColorsTheme().whiteColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: ColorsTheme().primaryDark.withValues(alpha: 0.2),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            AnimatedScale(
              scale: 1.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(icon, color: ColorsTheme().whiteColor, size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Text(
              title,
              style: AppTextStyles.styleRegular18sp(context).copyWith(
                color: ColorsTheme().whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
