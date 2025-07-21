import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upstream/core/theme/app_style.dart';
import 'package:upstream/core/utils/colors.dart';
import 'package:upstream/core/utils/cusotm_background.dart';

class ConferenceSloganView extends StatefulWidget {
  const ConferenceSloganView({super.key});

  @override
  State<ConferenceSloganView> createState() => _ConferenceSloganViewState();
}

class _ConferenceSloganViewState extends State<ConferenceSloganView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<String> displayedText = []; // النصوص اللي هتظهر تدريجيًا
  int currentVerseIndex = 0; // مؤشر البيت الحالي
  String currentVerse = ''; // النص الحالي اللي بيتكتب

  // كلمات الشعار مقسمة لأبيات
  final List<String> sloganVerses = const [
    'ماشي عكس الموج العالي، رافض أعيش بقلبي خالي.',
    'قلبي كان تايه ومحتار، رجعتلك... ضد التيار.',
    'القرار:',
    ' ضد التيار، راجع ليك، قلبي بإيدك مش بادي بيك',
    'خطوتي ثابتة وسط النّار، ماشي معاك... ضد التيار.',
    'سابني الكل وما لاقاني، غيرك وحدك اللي رعاني.',
    'يومي بيك صار ليه مسار، نُوّرتني... ضد التيار.',
    'الدنيا غرّتنا بشويه، بس الحقيقة فيك وحدك هيه.',
    'توبيتي بداية وانتصار، باسم يسوع... ضد التيار.',
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          duration: const Duration(seconds: 2), // مدة كتابة كل بيت
          vsync: this,
        )..addListener(() {
          if (_controller.isCompleted &&
              currentVerseIndex < sloganVerses.length) {
            setState(() {
              displayedText.add(sloganVerses[currentVerseIndex]);
              currentVerse = '';
              currentVerseIndex++;
              if (currentVerseIndex < sloganVerses.length) {
                _controller.reset();
                _controller.forward();
              }
            });
          } else {
            setState(() {
              currentVerse = sloganVerses[currentVerseIndex].substring(
                0,
                (_controller.value * sloganVerses[currentVerseIndex].length)
                    .floor(),
              );
            });
          }
        });

    // بدء الأنيميشن للبيت الأول
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('شعار المؤتمر'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.styleBold20sp(context),
        elevation: 4,
      ),
      body: CustomBackground(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...displayedText.map((verse) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Text(
                              verse,
                              style: AppTextStyles.styleRegular18sp(context)
                                  .copyWith(
                                    color: ColorsTheme().whiteColor,
                                    shadows: [
                                      Shadow(
                                        color: ColorsTheme().primaryDark
                                            .withValues(alpha: 0.4),
                                        blurRadius: 2,
                                        offset: const Offset(1, 1),
                                      ),
                                    ],
                                  ),
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                            ),
                          );
                        }),
                        // البيت الحالي اللي بيتكتب
                        if (currentVerseIndex < sloganVerses.length)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Text(
                                  currentVerse,
                                  style: AppTextStyles.styleRegular18sp(context)
                                      .copyWith(
                                        color: ColorsTheme().whiteColor,
                                        shadows: [
                                          Shadow(
                                            color: ColorsTheme().primaryDark
                                                .withValues(alpha: 0.4),
                                            blurRadius: 2,
                                            offset: const Offset(1, 1),
                                          ),
                                        ],
                                      ),
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
