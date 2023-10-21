// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:komunitas_belajar/presentation/pages/about_us/about_us_view.dart'
    as _i1;
import 'package:komunitas_belajar/presentation/pages/home/base_view.dart'
    as _i2;
import 'package:komunitas_belajar/presentation/pages/home/home_view.dart'
    as _i3;
import 'package:komunitas_belajar/presentation/pages/login/login_view.dart'
    as _i4;
import 'package:komunitas_belajar/presentation/pages/member/member_view.dart'
    as _i5;
import 'package:komunitas_belajar/presentation/pages/splashscreen/splash_screen_view.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AboutUsPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsPage(),
      );
    },
    BasePage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BasePage(),
      );
    },
    HomePage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LoginPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    MemberPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MemberPage(),
      );
    },
    SplashRoutePage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreenPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsPage]
class AboutUsPage extends _i7.PageRouteInfo<void> {
  const AboutUsPage({List<_i7.PageRouteInfo>? children})
      : super(
          AboutUsPage.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BasePage]
class BasePage extends _i7.PageRouteInfo<void> {
  const BasePage({List<_i7.PageRouteInfo>? children})
      : super(
          BasePage.name,
          initialChildren: children,
        );

  static const String name = 'BasePage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i7.PageRouteInfo<void> {
  const HomePage({List<_i7.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginPage extends _i7.PageRouteInfo<void> {
  const LoginPage({List<_i7.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MemberPage]
class MemberPage extends _i7.PageRouteInfo<void> {
  const MemberPage({List<_i7.PageRouteInfo>? children})
      : super(
          MemberPage.name,
          initialChildren: children,
        );

  static const String name = 'MemberPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreenPage]
class SplashRoutePage extends _i7.PageRouteInfo<void> {
  const SplashRoutePage({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoutePage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
