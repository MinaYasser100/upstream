import 'package:go_router/go_router.dart';
import 'package:upstream/core/routing/routes.dart';
import 'package:upstream/features/book/ui/book_study_view.dart';
import 'package:upstream/features/conference/ui/conference_view.dart';
import 'package:upstream/features/conference/ui/widgets/saint_moses_view.dart';
import 'package:upstream/features/conference/ui/widgets/steps_view.dart';
import 'package:upstream/features/conference/ui/widgets/success_quotes_view.dart';
import 'package:upstream/features/home/ui/home_view.dart';
import 'package:upstream/features/home/ui/widgets/conference_slogan_view.dart';

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
