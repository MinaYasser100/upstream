import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/hymns/data/hymns_data.dart';

import 'hymn_list_item.dart';

class HymnsBodyView extends StatelessWidget {
  const HymnsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorsTheme(); // to shorten usage

    return CustomBackground(
      child: RawScrollbar(
        thumbColor: ColorsTheme().whiteColor,
        radius: Radius.circular(5.r),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CustomTitleView(title: 'ترانيم'),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final hymn = HymnsData.hymns[index];
                return HymnListItem(colors: colors, hymn: hymn, index: index);
              }, childCount: HymnsData.hymns.length),
            ),
            CustomDivider(),
          ],
        ),
      ),
    );
  }
}
