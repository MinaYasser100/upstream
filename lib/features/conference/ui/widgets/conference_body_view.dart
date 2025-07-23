import 'package:flutter/material.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/conference/data/conference_model.dart';

import 'list_item_of_conference_index.dart';

class ConferenceBodyView extends StatelessWidget {
  const ConferenceBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorsTheme();

    return Scaffold(
      body: CustomBackground(
        child: RawScrollbar(
          radius: Radius.circular(5),
          thumbColor: colors.whiteColor,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CustomTitleView(title: 'مؤتمرنا'),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final button = buttons[index];
                  return ListItemOfConferenceList(
                    colors: colors,
                    button: button,
                    index: index,
                  );
                }, childCount: buttons.length),
              ),
              CustomDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
