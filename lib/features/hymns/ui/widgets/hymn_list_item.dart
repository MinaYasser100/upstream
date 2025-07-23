import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/features/hymns/data/humn_model.dart';

import 'hymn_material_button.dart';

class HymnListItem extends StatelessWidget {
  const HymnListItem({
    super.key,
    required this.colors,
    required this.hymn,
    required this.index,
  });

  final ColorsTheme colors;
  final HymnModel hymn;
  final int index;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 400 + (index * 100)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              decoration: BoxDecoration(
                color: colors.cardColor,
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: colors.whiteColor.withValues(alpha: 0.15),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.primaryDark.withValues(alpha: 0.2),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: HymnMaterialButon(hymn: hymn, colors: colors),
            ),
          ),
        ),
      ),
    );
  }
}
