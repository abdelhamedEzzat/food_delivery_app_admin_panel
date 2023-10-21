import 'package:flutter/material.dart';
import 'package:food_delivery_admin_panel/screens/dashBoard/dashboard.dart';
import 'package:food_delivery_admin_panel/screens/settings/settings_screen.dart';

import '../screens/logout/logout.dart';
import '../screens/menu/menu.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings setting) {
    switch (setting.name) {
      case "/":
        return DashBoard.route();
      case DashBoard.nameRoute:
        return DashBoard.route();
      case MenuScreen.nameRoute:
        return MenuScreen.route();
      case LogOUT.nameRoute:
        return LogOUT.route();
      case SettingScreen.nameRoute:
        return SettingScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("error"),
              ),
            ),
        settings: const RouteSettings(name: "/error"));
  }
}
