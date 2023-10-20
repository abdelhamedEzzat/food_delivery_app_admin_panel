import 'package:flutter/material.dart';
import 'package:food_delivery_admin_panel/screens/dash_board/dash_board.dart';

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
      case LogOut.nameRoute:
        return LogOut.route();

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
