import 'package:flutter/material.dart';
import 'package:food_delivery_admin_panel/screens/dashBoard/dashboard.dart';
import 'package:food_delivery_admin_panel/screens/logout/logout.dart';
import 'package:food_delivery_admin_panel/screens/menu/menu.dart';
import 'package:food_delivery_admin_panel/screens/settings/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> screens = {
      "DashBoard": {
        "RouteName": DashBoard.nameRoute,
        "icon": const Icon(Icons.dashboard)
      },
      "Menu": {"RouteName": "MenuScreen", "icon": const Icon(Icons.menu_book)},
      "OpeningHours": {
        "RouteName": MenuScreen.nameRoute,
        "icon": const Icon(Icons.lock_clock)
      },
      "Setting": {
        "RouteName": SettingScreen.nameRoute,
        "icon": const Icon(Icons.logout_outlined)
      },
      "LogOut": {
        "RouteName": LogOUT.nameRoute,
        "icon": const Icon(Icons.logout_outlined)
      }
    };

    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 65.0,
            child: DrawerHeader(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Text(
                "Your Restourant Name",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          ...screens.entries.map((screen) {
            return ListTile(
              leading: screen.value["icon"],
              title: Text(screen.key),
              onTap: () {
                Navigator.of(context).pushNamed(screen.value["RouteName"]);
              },
            );
          })
        ],
      ),
    );
  }
}
