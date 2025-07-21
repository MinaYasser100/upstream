import 'package:flutter/material.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/conference/data/conference_data.dart';

import 'custom_saint_second_title.dart';
import 'content_text_body_view.dart';

class SaintMosesView extends StatelessWidget {
  const SaintMosesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // العنوان الرئيسي
            const CustomTitleView(title: 'شفيع المؤتمر'),
            CustomSanitSecondTitle(),
            // نص السيرة كاملاً في كارت واحد
            ContentTextBodyView(text: ConferenceData.biography),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
