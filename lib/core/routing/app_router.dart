import 'package:go_router/go_router.dart';
import 'package:upstream/core/routing/routes.dart';
import 'package:upstream/features/book/data/model/study_model.dart';
import 'package:upstream/features/book/ui/book_study_view.dart';
import 'package:upstream/features/book/ui/widgets/book_study_content.dart';
import 'package:upstream/features/conference/ui/conference_view.dart';
import 'package:upstream/features/conference/ui/widgets/fathers_sayings_view.dart';
import 'package:upstream/features/conference/ui/widgets/job_opportunities_view.dart';
import 'package:upstream/features/conference/ui/widgets/saint_moses_view.dart';
import 'package:upstream/features/conference/ui/widgets/spiritual_prescription_view.dart';
import 'package:upstream/features/conference/ui/widgets/steps_view.dart';
import 'package:upstream/features/conference/ui/widgets/success_quotes_view.dart';
import 'package:upstream/features/conference/ui/widgets/think_with_us_view.dart';
import 'package:upstream/features/conference/ui/widgets/voice_of_lord_view.dart';
import 'package:upstream/features/home/ui/home_view.dart';
import 'package:upstream/features/home/ui/widgets/conference_slogan_view.dart';
import 'package:upstream/features/hymns/data/humn_model.dart';
import 'package:upstream/features/hymns/ui/hymns_view.dart';
import 'package:upstream/features/hymns/ui/widgets/hymn_view.dart';

import 'animation_route.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => fadeTransitionPage(HomeView()),
      ),
      GoRoute(
        path: Routes.conferenceSlogan,
        pageBuilder: (context, state) =>
            fadeTransitionPage(ConferenceSloganView()),
      ),
      GoRoute(
        path: Routes.bookStudy,
        pageBuilder: (context, state) => fadeTransitionPage(BookStudyView()),
      ),
      GoRoute(
        path: Routes.conference,
        pageBuilder: (context, state) => fadeTransitionPage(ConferenceView()),
      ),
      GoRoute(
        path: Routes.saintMoses,
        pageBuilder: (context, state) => fadeTransitionPage(SaintMosesView()),
      ),
      GoRoute(
        path: Routes.successQuotes,
        pageBuilder: (context, state) =>
            fadeTransitionPage(SuccessQuotesView()),
      ),
      GoRoute(
        path: Routes.steps,
        pageBuilder: (context, state) => fadeTransitionPage(StepsView()),
      ),
      GoRoute(
        path: Routes.spiritualPrescription,
        pageBuilder: (context, state) =>
            fadeTransitionPage(SpiritualPrescriptionView()),
      ),
      GoRoute(
        path: Routes.thinkWithUs,
        pageBuilder: (context, state) => fadeTransitionPage(ThinkWithUsView()),
      ),
      GoRoute(
        path: Routes.jobOpportunities,
        pageBuilder: (context, state) =>
            fadeTransitionPage(JobOpportunitiesView()),
      ),
      GoRoute(
        path: Routes.voiceOfLord,
        pageBuilder: (context, state) => fadeTransitionPage(VoiceOfLordView()),
      ),
      GoRoute(
        path: Routes.fathersSaying,
        pageBuilder: (context, state) =>
            fadeTransitionPage(FathersSayingsView()),
      ),
      GoRoute(
        path: Routes.hymns,
        pageBuilder: (context, state) => fadeTransitionPage(HymnsView()),
      ),
      GoRoute(
        path: Routes.hymn,
        pageBuilder: (context, state) {
          final hymn = state.extra as HymnModel?;
          if (hymn == null) throw Exception('Hymn not found');
          return fadeTransitionPage(HymnView(hymn: hymn));
        },
      ),
      GoRoute(
        path: Routes.bookStudyContent,
        pageBuilder: (context, state) {
          final study = state.extra as Study?;
          if (study == null) throw Exception('Hymn not found');
          return fadeTransitionPage(BookStudyContent(study: study));
        },
      ),
      // GoRoute(
      //   path: Routes.productDetails,
      //   pageBuilder: (context, state) {
      //     final product = state.extra as Product?;
      //     if (product == null) throw Exception('Product not found');
      //     return fadeTransitionPage(ProductDetailsView(product: product));
      //   },
      // ),
    ],
  );
}

// Future<String> getFirstScreen() async {
//   final isOnboardingSeen = OnboardingHive().isOnboardingSeen();
//   if (!isOnboardingSeen) {
//     return Routes.onboarding;
//   }
//   // Ensure MonitoringSystemHiveService is ready
//   final monitoringService =
//       await GetIt.I.getAsync<MonitoringSystemHiveService>();
//   final farmOwnerStatus = monitoringService.getFarmOwnerStatus();

//   if (farmOwnerStatus == null) {
//     return Routes.userTypeSelectionScreen;
//   } else if (!farmOwnerStatus) {
//     return Routes.layoutScreens;
//   } else if (farmOwnerStatus &&
//       monitoringService.getFarmerSelectedPlants().isEmpty) {
//     return Routes.plantsSelectionScreen;
//   } else {
//     return Routes.layoutScreens;
//   }
// }
