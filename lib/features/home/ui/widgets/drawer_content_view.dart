import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:upstream/core/routing/routes.dart';
import 'package:upstream/features/home/ui/func/build_drawer_item.dart';

import 'by_widget.dart';

class DrawerContentView extends StatelessWidget {
  const DrawerContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: DrawerHeader(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/logo.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox.shrink(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            buildAnimatedDrawerItem(
              context,
              icon: Icons.schedule,
              title: 'جدول المؤتمر',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            buildAnimatedDrawerItem(
              context,
              icon: Icons.music_note,
              title: 'شعار المؤتمر',
              onTap: () {
                context.push(Routes.conferenceSlogan);
              },
            ),
            buildAnimatedDrawerItem(
              context,
              icon: Icons.contact_mail,
              title: 'دراسة كتاب',
              onTap: () {
                context.push(Routes.bookStudy);
              },
            ),
            buildAnimatedDrawerItem(
              context,
              icon: Icons.event,
              title: 'مؤتمرنا',
              onTap: () {
                context.push(Routes.conference);
              },
            ),
          ]),
        ),
        ByWidget(),
      ],
    );
  }
}
