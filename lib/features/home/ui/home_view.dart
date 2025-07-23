import 'package:flutter/material.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/features/home/ui/widgets/home_body_view.dart';

import 'widgets/home_drawer_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مؤتمر Upstream'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.styleBold20sp(
          context,
        ).copyWith(color: ColorsTheme().whiteColor),
        elevation: 4,
        shadowColor: ColorsTheme().primaryDark.withValues(alpha: 0.3),
      ),
      endDrawer: HomeDrawerView(),
      body: const HomeBodyView(),
    );
  }
}
