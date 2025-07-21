import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:upstream/core/routing/routes.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/hymns/data/hymns_data.dart';

class HymnsBodyView extends StatelessWidget {
  const HymnsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          CustomTitleView(title: 'ترانيم'),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final hymn = HymnsData.hymns[index];
              return ZoomIn(
                duration: Duration(milliseconds: 600 + (index * 100)),
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
                        child: Material(
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: () {
                              context.push(Routes.hymn, extra: hymn);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(20.w),
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Icon(
                                    Icons.music_note_outlined,
                                    color: ColorsTheme().iconColor,
                                    size: 24.sp,
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Text(
                                      hymn.title,
                                      style:
                                          AppTextStyles.styleBold20sp(
                                            context,
                                          ).copyWith(
                                            color: ColorsTheme().primaryColor,
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
                    ),
                  ),
                ),
              );
            }, childCount: HymnsData.hymns.length),
          ),
          CustomDivider(),
        ],
      ),
    );
  }
}
