import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:upstream/core/routing/routes.dart';
import 'package:upstream/core/theme/app_style.dart' show AppTextStyles;
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/features/home/ui/func/build_drawer_item.dart';

class HomeDrawerView extends StatelessWidget {
  const HomeDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorsTheme().gradientStart, ColorsTheme().gradientEnd],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // رأس الـ Drawer
            DrawerHeader(
              // decoration: BoxDecoration(
              //   color: ColorsTheme().primaryColor,
              //   image: const DecorationImage(
              //     image: AssetImage('assets/images/conference_logo.png'), // ضيف أصل الصورة هنا
              //     fit: BoxFit.cover,
              //     opacity: 0.3,
              //   ),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مؤتمر Upstream',
                    style: AppTextStyles.styleBold28sp(context).copyWith(
                      color: ColorsTheme().whiteColor,
                      shadows: [
                        Shadow(
                          color: ColorsTheme().primaryDark.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'َضد التيار',
                    style: AppTextStyles.styleRegular20sp(context).copyWith(
                      color: ColorsTheme().whiteColor.withValues(alpha: 0.8),
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            buildDrawerItem(
              context,
              icon: Icons.schedule,
              title: 'جدول المؤتمر',
              onTap: () {
                context.go(Routes.home);
              },
            ),
            buildDrawerItem(
              context,
              icon: Icons.music_note,
              title: 'شعار المؤتمر',
              onTap: () {
                context.push(Routes.conferenceSlogan);
              },
            ),
            buildDrawerItem(
              context,
              icon: Icons.contact_mail,
              title: "دراسة كتاب",
              onTap: () {
                context.push(Routes.bookStudy);
              },
            ),
            buildDrawerItem(
              context,
              icon: Icons.event,
              title: 'مؤتمرنا',
              onTap: () {
                context.push(Routes.conference);
              },
            ),
          ],
        ),
      ),
    );
  }
}
