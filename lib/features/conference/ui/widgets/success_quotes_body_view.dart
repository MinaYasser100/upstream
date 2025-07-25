import 'package:flutter/material.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/conference/data/conference_data.dart';
import 'package:upstream/features/conference/ui/widgets/content_list_body_view.dart';

class SuccessQuotesBodyView extends StatelessWidget {
  const SuccessQuotesBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = ConferenceData.quotes.trim().split('\n\n');

    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          slivers: [
            const CustomTitleView(title: 'قالوا عن النجاح'),
            ContentListBodyView(stringList: quotes),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
