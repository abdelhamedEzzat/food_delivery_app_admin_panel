import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  static const String nameRoute = "LogOut";
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const LogOut(),
        settings: const RouteSettings(name: nameRoute));
  }

  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
