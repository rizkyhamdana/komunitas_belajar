// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:komunitas_belajar/presentation/pages/about_us/about_us_view.dart'
    as _i1;
import 'package:komunitas_belajar/presentation/pages/home/base_view.dart'
    as _i2;
import 'package:komunitas_belajar/presentation/pages/home/home_view.dart'
    as _i3;
import 'package:komunitas_belajar/presentation/pages/member/member_view.dart'
    as _i4;
import 'package:komunitas_belajar/presentation/pages/splashscreen/splash_screen_view.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AboutUsPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsPage(),
      );
    },
    BasePage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BasePage(),
      );
    },
    HomePage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    MemberPage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MemberPage(),
      );
    },
    SplashRoutePage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreenPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsPage]
class AboutUsPage extends _i6.PageRouteInfo<void> {
  const AboutUsPage({List<_i6.PageRouteInfo>? children})
      : super(
          AboutUsPage.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BasePage]
class BasePage extends _i6.PageRouteInfo<void> {
  const BasePage({List<_i6.PageRouteInfo>? children})
      : super(
          BasePage.name,
          initialChildren: children,
        );

  static const String name = 'BasePage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i6.PageRouteInfo<void> {
  const HomePage({List<_i6.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MemberPage]
class MemberPage extends _i6.PageRouteInfo<void> {
  const MemberPage({List<_i6.PageRouteInfo>? children})
      : super(
          MemberPage.name,
          initialChildren: children,
        );

  static const String name = 'MemberPage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreenPage]
class SplashRoutePage extends _i6.PageRouteInfo<void> {
  const SplashRoutePage({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoutePage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
