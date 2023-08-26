import 'package:flutter/material.dart';
import 'package:flutter_route_generator/flutter_route_generator.dart';

import 'index.dart';

enum AppRoutes {
  home("home"),
  settings("settings"),
  splash("splash");

  final String route;

  const AppRoutes(this.route);
}

class AppRouter extends RouteGenerator {
  const AppRouter._();

  static AppRouter get I => const AppRouter._();

  @override
  Map<String, RouteBuilder> attach() {
    return {
      AppRoutes.home.route: home,
      AppRoutes.settings.route: settings,
      AppRoutes.splash.route: splash,
    };
  }

  @override
  Widget onDefault(BuildContext context, Object? data) => home(context, data);

  Widget home(BuildContext context, Object? data) {
    return const HomeActivity();
  }

  Widget settings(BuildContext context, Object? data) {
    return const SettingsActivity();
  }

  Widget splash(BuildContext context, Object? data) {
    return const SplashActivity();
  }
}
