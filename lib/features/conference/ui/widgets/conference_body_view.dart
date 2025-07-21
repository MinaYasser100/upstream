import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:upstream/core/routing/routes.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';

class ConferenceBodyView extends StatelessWidget {
  const ConferenceBodyView({super.key});

  // قائمة الأزرار مع الأيقونات المرتبطة
  static const List<Map<String, dynamic>> buttons = [
    {'title': 'شفيع المؤتمر', 'icon': Icons.star, 'route': Routes.saintMoses},
    {
      'title': 'قالوا عن النجاح',
      'icon': Icons.format_quote,
      'route': Routes.successQuotes,
    },
    {'title': 'الخطوات', 'icon': Icons.directions_walk, 'route': Routes.steps},
    {
      'title': 'روشتة روحية',
      'icon': Icons.healing,
      'route': Routes.spiritualPrescription,
    },
    {
      'title': 'فكر معانا',
      'icon': Icons.lightbulb,
      'route': Routes.thinkWithUs,
    },
    {
      'title': 'مطلوب للعمل بأجور مجزية',
      'icon': Icons.work,
      'route': Routes.jobOpportunities,
    },
    {
      'title': 'صَوْتُ الرَّبِّ يُطفَيُ لُهُبَ نَارٍ',
      'icon': Icons.flare,
      'route': Routes.voiceOfLord,
    },
    {'title': 'أقوال آباء', 'icon': Icons.book, 'route': Routes.fathersSaying},
    {
      "title": 'ترانيم',
      "icon": Icons.music_note_outlined,
      "route": Routes.hymns,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            CustomTitleView(title: 'مؤتمرنا'),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final button = buttons[index];
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
                                context.push(button['route'] as String);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(20.w),
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Icon(
                                      button['icon'] as IconData,
                                      color: ColorsTheme().accentColor,
                                      size: 24.sp,
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: Text(
                                        button['title'] as String,
                                        style:
                                            AppTextStyles.styleBold20sp(
                                              context,
                                            ).copyWith(
                                              color: ColorsTheme().textColor,
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
              }, childCount: buttons.length),
            ),
            // فاصل أسفل القائمة
            CustomDivider(),
          ],
        ),
      ),
    );
  }
}
