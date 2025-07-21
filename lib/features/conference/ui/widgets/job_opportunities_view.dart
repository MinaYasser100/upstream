import 'package:flutter/material.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/conference/data/conference_data.dart';

import 'content_list_body_view.dart';

class JobOpportunitiesView extends StatelessWidget {
  const JobOpportunitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final jobs = ConferenceData.jobs.trim().split('\n\n');
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const CustomTitleView(title: 'مطلوب للعمل بأجور مجزية'),
            ContentListBodyView(stringList: jobs),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
