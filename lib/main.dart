import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin_panel/blocs/categories/categories_bloc.dart';
import 'package:food_delivery_admin_panel/blocs/product/product_bloc.dart';
import 'package:food_delivery_admin_panel/blocs/settings/settings_bloc.dart';
import 'package:food_delivery_admin_panel/config/approuter.dart';
import 'package:food_delivery_admin_panel/config/theme.dart';
import 'package:food_delivery_admin_panel/models/category_model.dart';
import 'package:food_delivery_admin_panel/models/opening_hours_model.dart';
import 'package:food_delivery_admin_panel/models/product_model.dart';
import 'package:food_delivery_admin_panel/models/restaurant_model.dart';
import 'package:food_delivery_admin_panel/screens/menu/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc()
            ..add(LoadCategory(categories: Category.categories)),
        ),
        BlocProvider(
          create: (context) =>
              ProductBloc(categorybloc: BlocProvider.of<CategoryBloc>(context))
                ..add(LoadProduct(products: Product.products)),
        ),
        BlocProvider(
            create: (context) => SettingsBloc()
              ..add(LoadSettings(
                  restaurant:
                      Restaurant(openingHours: OpeningHours.openingHourList))))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGeneratedRoute,
        initialRoute: MenuScreen.nameRoute,
      ),
    );
  }
}
