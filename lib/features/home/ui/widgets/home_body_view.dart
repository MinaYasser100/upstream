import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/features/home/data/appointment_data.dart';

import 'by_widget.dart';
import 'home_title_view.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  // دالة لتحديد الأيقونة بناءً على الحدث
  IconData _getIconForEvent(String event) {
    if (event.contains('صح النوم')) return Icons.wb_sunny;
    if (event.contains('تسبحة') || event.contains('القداس')) {
      return Icons.church;
    }
    if (event.contains('الكتاب المقدس')) return Icons.book;
    if (event.contains('الفطار')) return Icons.coffee;
    if (event.contains('نعوم')) return Icons.pool;
    if (event.contains('استحمام')) return Icons.shower;
    if (event.contains('الغذاء')) return Icons.restaurant;
    if (event.contains('صلاة')) return Icons.access_time;
    if (event.contains('كلمة روحية')) return Icons.mic;
    if (event.contains('دوري')) return Icons.sports;
    if (event.contains('جولة') || event.contains('ورشة')) return Icons.group;
    if (event.contains('العشاء')) return Icons.dinner_dining;
    if (event.contains('حفلة')) return Icons.music_note;
    if (event.contains('تصبح')) return Icons.nightlight_round;
    return Icons.event; // أيقونة افتراضية
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorsTheme().gradientStart, ColorsTheme().gradientEnd],
        ),
      ),
      child: CustomScrollView(
        slivers: [
          HomeTitleView(),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = schedule[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Card(
                  elevation: 6,
                  shadowColor: ColorsTheme().primaryDark.withValues(alpha: 0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorsTheme().cardColor,
                          ColorsTheme().eventHighlightColor,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Icon(
                              _getIconForEvent(item['event']!),
                              color: ColorsTheme().primaryColor,
                              size: 24.sp,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            item['time']!,
                            style: AppTextStyles.styleBold16sp(
                              context,
                            ).copyWith(color: ColorsTheme().textColor),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                      title: Text(
                        item['event']!,
                        style: AppTextStyles.styleBold18sp(
                          context,
                        ).copyWith(color: ColorsTheme().textColor),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
              );
            }, childCount: schedule.length),
          ),
          ByWidget(),
        ],
      ),
    );
  }
}
