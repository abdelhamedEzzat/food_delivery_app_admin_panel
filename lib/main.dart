import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin_panel/blocs/categories/categories_bloc.dart';
import 'package:food_delivery_admin_panel/blocs/product/product_bloc.dart';
import 'package:food_delivery_admin_panel/config/theme.dart';
import 'package:food_delivery_admin_panel/models/category_model.dart';
import 'package:food_delivery_admin_panel/models/product_model.dart';
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
          create: (context) => CategoriesBloc()
            ..add(LoadCategory(categories: Category.categories)),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
              categorybloc: BlocProvider.of<CategoriesBloc>(context))
            ..add(LoadProduct(products: Product.products)),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const MenuScreen()),
    );
  }
}
