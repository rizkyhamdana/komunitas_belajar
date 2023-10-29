import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoutePage.page,
          initial: true,
        ),
        AutoRoute(page: BasePage.page),
        CustomRoute(
            page: LoginPage.page,
            transitionsBuilder: TransitionsBuilders.noTransition),
        AutoRoute(page: HomePage.page),
        AutoRoute(page: EventDetailPage.page),
        AutoRoute(page: MemberPage.page),
        AutoRoute(page: AboutUsPage.page),
        AutoRoute(page: CameraCommunityEventPage.page),
        AutoRoute(page: CommunityEventUploadPage.page),
      ];
}
