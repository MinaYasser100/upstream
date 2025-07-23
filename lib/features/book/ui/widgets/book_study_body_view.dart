import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/book/data/book_study_data.dart';

import 'book_study_item_view.dart';

class BookStudyBodyView extends StatelessWidget {
  const BookStudyBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: RawScrollbar(
          thumbColor: ColorsTheme().whiteColor,
          radius: Radius.circular(5.r),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              CustomTitleView(title: 'دراسات الكتاب'),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final study = BookStudyData.studies[index];
                  return BookStudyItemView(study: study, index: index);
                }, childCount: BookStudyData.studies.length),
              ),
              // فاصل أسفل القائمة
              CustomDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
