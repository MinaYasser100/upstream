import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:upstream/core/routing/routes.dart';
import 'package:upstream/core/theme/app_style.dart' show AppTextStyles;
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/features/home/ui/func/build_drawer_item.dart';
import 'package:upstream/features/home/ui/widgets/by_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: DrawerHeader(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/logo.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
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
                    SizedBox(height: 8.h),
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
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                buildDrawerItem(
                  context,
                  icon: Icons.schedule,
                  title: 'جدول المؤتمر',
                  onTap: () {
                    Navigator.pop(context);
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
                  title: 'دراسة كتاب',
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
              ]),
            ),
            ByWidget(),
          ],
        ),
      ),
    );
  }
}
