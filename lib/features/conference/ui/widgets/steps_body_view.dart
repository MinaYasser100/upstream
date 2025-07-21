import 'package:flutter/material.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/conference/data/conference_data.dart';
import 'package:upstream/features/conference/ui/widgets/content_text_body_view.dart';

class StepsBodyView extends StatelessWidget {
  const StepsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // العنوان الرئيسي
          const CustomTitleView(title: 'الخطوات'),
          ContentTextBodyView(text: ConferenceData.steps),
          const CustomDivider(),
        ],
      ),
    );
  }
}
