import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';

class ContentListBodyView extends StatelessWidget {
  const ContentListBodyView({super.key, required this.stringList});

  final List<String> stringList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return FadeInUp(
          duration: Duration(milliseconds: 500 + (index * 150)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsTheme().cardColor,
                    borderRadius: BorderRadius.circular(22.r),
                    border: Border.all(
                      color: ColorsTheme().whiteColor.withOpacity(0.25),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: ColorsTheme().primaryDark.withOpacity(0.05),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.format_quote_rounded,
                        color: ColorsTheme().iconColor,
                        size: 32.sp,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          stringList[index],
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }, childCount: stringList.length),
    );
  }
}
