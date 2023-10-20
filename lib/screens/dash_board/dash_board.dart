import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  static const String nameRoute = "DashBoard";
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const DashBoard(),
        settings: const RouteSettings(name: nameRoute));
  }

  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
