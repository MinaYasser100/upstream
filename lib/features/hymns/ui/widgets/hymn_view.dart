import 'package:flutter/material.dart';
import 'package:upstream/core/utils/cusotm_background.dart';
import 'package:upstream/core/utils/custom_divider.dart';
import 'package:upstream/core/utils/custom_title_view.dart';
import 'package:upstream/features/hymns/data/humn_model.dart';
import 'package:upstream/features/hymns/ui/widgets/content_hymn_view.dart';

class HymnView extends StatelessWidget {
  const HymnView({super.key, required this.hymn});
  final HymnModel hymn;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // العنوان الرئيسي
            CustomTitleView(title: hymn.title),
            ContentHymnView(text: hymn.hymn),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}
