import 'package:flutter/material.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/conference/data/conference_data.dart';
import 'package:upstream/features/conference/ui/widgets/content_list_body_view.dart';

class FathersSayingsView extends StatelessWidget {
  const FathersSayingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final fathersSaying = ConferenceData.fathersSaying.trim().split('\n\n');
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            // العنوان الرئيسي
            CustomTitleView(title: 'أقوال آباء'),
            ContentListBodyView(stringList: fathersSaying),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
