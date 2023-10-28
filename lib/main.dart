import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:komunitas_belajar/config/helper/database_helper.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:komunitas_belajar/config/util/app_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'config/route/app_route.dart';
import 'config/services/injection.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AppConfig.isDebug = true;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    configLoading();
    runApp(const MyApp());
  });
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(
        navigatorObservers: () => [MyObserver()],
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.blue1),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
    );
  }
}

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log('Route Pushed to: ${route.settings.name ?? 'Dialog'}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('Route Popped to: ${previousRoute?.settings.name}');
  }

  // only override to observer tab routes
}
