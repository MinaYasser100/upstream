import 'package:flutter/material.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/book/data/model/study_model.dart';

import 'content_book_study_view.dart';

class BookStudyContent extends StatelessWidget {
  const BookStudyContent({super.key, required this.study});
  final Study study;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // العنوان الرئيسي
            CustomTitleView(title: study.title),
            ContentBookStudyView(text: study.text),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
