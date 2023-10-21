import 'package:flutter/material.dart';
import 'package:food_delivery_admin_panel/screens/settings/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> screens = {
      // "DashBoard": {
      //   "RouteName": "DashBoard",
      //   "icon": const Icon(Icons.dashboard)
      // },
      "Menu": {"RouteName": "MenuScreen", "icon": const Icon(Icons.menu_book)},
      "Setting": {
        "RouteName": SettingScreen.nameRoute,
        "icon": const Icon(Icons.lock_clock)
      },
      // "LogOut": {
      //   "RouteName": "LogOUT",
      //   "icon": const Icon(Icons.logout_outlined)
      // }
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
