import 'package:flutter/material.dart';

class LogOUT extends StatelessWidget {
  const LogOUT({super.key});
  static const String nameRoute = "LogOUT";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const LogOUT(),
        settings: const RouteSettings(name: nameRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
