import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/features/conference/data/conference_model.dart';

import 'material_list_item.dart';

class ListItemOfConferenceList extends StatelessWidget {
  const ListItemOfConferenceList({
    super.key,
    required this.colors,
    required this.button,
    required this.index,
  });

  final ColorsTheme colors;
  final ConferenceButton button;
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
                    color: colors.primaryDark.withValues(alpha: 0.15),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: MaterialListItem(button: button, colors: colors),
            ),
          ),
        ),
      ),
    );
  }
}
