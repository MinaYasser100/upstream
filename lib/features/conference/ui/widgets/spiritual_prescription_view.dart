import 'package:flutter/material.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/conference/data/conference_data.dart';

import 'content_list_body_view.dart';

class SpiritualPrescriptionView extends StatelessWidget {
  const SpiritualPrescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final spiritualPrescription = ConferenceData.spiritualPrescription
        .trim()
        .split('\n\n');
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            // العنوان الرئيسي
            CustomTitleView(title: 'روشتة روحية'),
            ContentListBodyView(stringList: spiritualPrescription),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
