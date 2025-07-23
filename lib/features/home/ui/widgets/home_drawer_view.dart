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
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorsTheme().gradientStart.withValues(alpha: 0.95),
              ColorsTheme().gradientEnd.withValues(alpha: 0.95),
            ],
            stops: const [0.0, 1.0],
          ),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsTheme().primaryDark.withValues(alpha: 0.3),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(-4, 0),
            ),
          ],
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: DrawerHeader(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/logo.jpeg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      ColorsTheme().primaryDark.withValues(alpha: 0.2),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مؤتمر Upstream',
                      style: AppTextStyles.styleBold28sp(context).copyWith(
                        color: ColorsTheme().whiteColor,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            color: ColorsTheme().primaryDark.withValues(
                              alpha: 0.6,
                            ),
                            blurRadius: 6,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'ضد التيار',
                      style: AppTextStyles.styleRegular20sp(context).copyWith(
                        color: ColorsTheme().whiteColor.withValues(alpha: 0.9),
                        letterSpacing: 0.8,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
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
        ),
      ),
    );
  }
}
