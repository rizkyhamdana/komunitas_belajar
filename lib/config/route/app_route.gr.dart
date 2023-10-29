// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:komunitas_belajar/data/model/community_event.dart' as _i11;
import 'package:komunitas_belajar/presentation/pages/about_us/about_us_view.dart'
    as _i1;
import 'package:komunitas_belajar/presentation/pages/community_event/camera_community_event_view.dart'
    as _i3;
import 'package:komunitas_belajar/presentation/pages/community_event/detail/event_detail_view.dart'
    as _i4;
import 'package:komunitas_belajar/presentation/pages/home/base_view.dart'
    as _i2;
import 'package:komunitas_belajar/presentation/pages/home/home_view.dart'
    as _i5;
import 'package:komunitas_belajar/presentation/pages/login/login_view.dart'
    as _i6;
import 'package:komunitas_belajar/presentation/pages/member/member_view.dart'
    as _i7;
import 'package:komunitas_belajar/presentation/pages/splashscreen/splash_screen_view.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AboutUsPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsPage(),
      );
    },
    BasePage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BasePage(),
      );
    },
    CameraCommunityEventPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CameraCommunityEventPage(),
      );
    },
    EventDetailPage.name: (routeData) {
      final args = routeData.argsAs<EventDetailPageArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.EventDetailPage(
          key: args.key,
          communityEvent: args.communityEvent,
        ),
      );
    },
    HomePage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    LoginPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginPage(),
      );
    },
    MemberPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MemberPage(),
      );
    },
    SplashRoutePage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashScreenPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsPage]
class AboutUsPage extends _i9.PageRouteInfo<void> {
  const AboutUsPage({List<_i9.PageRouteInfo>? children})
      : super(
          AboutUsPage.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BasePage]
class BasePage extends _i9.PageRouteInfo<void> {
  const BasePage({List<_i9.PageRouteInfo>? children})
      : super(
          BasePage.name,
          initialChildren: children,
        );

  static const String name = 'BasePage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CameraCommunityEventPage]
class CameraCommunityEventPage extends _i9.PageRouteInfo<void> {
  const CameraCommunityEventPage({List<_i9.PageRouteInfo>? children})
      : super(
          CameraCommunityEventPage.name,
          initialChildren: children,
        );

  static const String name = 'CameraCommunityEventPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EventDetailPage]
class EventDetailPage extends _i9.PageRouteInfo<EventDetailPageArgs> {
  EventDetailPage({
    _i10.Key? key,
    required _i11.CommunityEvent communityEvent,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          EventDetailPage.name,
          args: EventDetailPageArgs(
            key: key,
            communityEvent: communityEvent,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailPage';

  static const _i9.PageInfo<EventDetailPageArgs> page =
      _i9.PageInfo<EventDetailPageArgs>(name);
}

class EventDetailPageArgs {
  const EventDetailPageArgs({
    this.key,
    required this.communityEvent,
  });

  final _i10.Key? key;

  final _i11.CommunityEvent communityEvent;

  @override
  String toString() {
    return 'EventDetailPageArgs{key: $key, communityEvent: $communityEvent}';
  }
}

/// generated route for
/// [_i5.HomePage]
class HomePage extends _i9.PageRouteInfo<void> {
  const HomePage({List<_i9.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginPage]
class LoginPage extends _i9.PageRouteInfo<void> {
  const LoginPage({List<_i9.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MemberPage]
class MemberPage extends _i9.PageRouteInfo<void> {
  const MemberPage({List<_i9.PageRouteInfo>? children})
      : super(
          MemberPage.name,
          initialChildren: children,
        );

  static const String name = 'MemberPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashScreenPage]
class SplashRoutePage extends _i9.PageRouteInfo<void> {
  const SplashRoutePage({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoutePage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
