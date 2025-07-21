// دالة لبناء عنصر في الـ Drawer
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';

Widget buildDrawerItem(
  BuildContext context, {
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return ZoomIn(
    duration: const Duration(milliseconds: 600),
    child: ListTile(
      leading: Icon(icon, color: ColorsTheme().iconColor, size: 24.sp),
      title: Text(
        title,
        style: AppTextStyles.styleRegular16sp(
          context,
        ).copyWith(color: ColorsTheme().whiteColor),
        textDirection: TextDirection.rtl,
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      tileColor: ColorsTheme().primaryDark.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: ColorsTheme().iconColor.withValues(alpha: 0.7),
        size: 16.sp,
      ),
    ),
  );
}
