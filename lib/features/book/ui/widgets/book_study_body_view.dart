import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/features/book/data/book_study_data.dart';

import 'book_study_item_view.dart';
import 'book_study_title_view.dart';

class BookStudyBodyView extends StatelessWidget {
  const BookStudyBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorsTheme().gradientStart,
              ColorsTheme().gradientEnd.withValues(alpha: .8),
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            BookStudyTitleView(),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final study = BookStudyData.studies[index];
                return BookStudyItemView(study: study, index: index);
              }, childCount: BookStudyData.studies.length),
            ),
            // فاصل أسفل القائمة
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Divider(
                  color: ColorsTheme().whiteColor.withValues(alpha: .3),
                  thickness: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
