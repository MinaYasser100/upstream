import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:upstream/core/routing/routes.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/features/book/data/model/study_model.dart';

class BookStudyMaterialButton extends StatelessWidget {
  const BookStudyMaterialButton({
    super.key,
    required this.study,
    required this.colors,
  });

  final Study study;
  final ColorsTheme colors;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24.r),
        onTap: () {
          context.push(Routes.bookStudyContent, extra: study);
        },
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [colors.primaryColor, colors.primaryDark],
                  ),
                ),
                padding: EdgeInsets.all(10.r),
                child: Icon(Icons.book, color: colors.iconColor, size: 26.sp),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Text(
                  study.title,
                  style: AppTextStyles.styleBold20sp(context).copyWith(
                    color: colors.primaryDark,
                    shadows: [
                      Shadow(
                        color: colors.primaryDark.withValues(alpha: 0.3),
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
