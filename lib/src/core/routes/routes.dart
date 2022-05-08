import '/src/presentation/screens/demo/demo.dart';

import '../../presentation/screens/home/home.dart';
import 'package:flutter/material.dart';

class RoutePaths {
  static const String home = '/home';
  static const String demo = '/demo';
}

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.home:
        List<dynamic> args = settings.arguments as List<dynamic>;

        // HOME
        var title = args[0] as String?;
        return MaterialPageRoute(
            builder: (_) => HomePage(title: title ?? ""), settings: settings);

      case RoutePaths.demo:
        return MaterialPageRoute(
            builder: (_) => const DemoPage(), settings: settings);

      default:
        return null;
    }
  }
}
