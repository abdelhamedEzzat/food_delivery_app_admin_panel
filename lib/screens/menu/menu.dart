import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin_panel/blocs/categories/categories_bloc.dart';
import 'package:food_delivery_admin_panel/blocs/product/product_bloc.dart';
import 'package:food_delivery_admin_panel/config/responsive.dart';
import 'package:food_delivery_admin_panel/models/product_model.dart';
import 'package:food_delivery_admin_panel/widgets/custom_appbar.dart';
import 'package:food_delivery_admin_panel/widgets/product_card.dart';
import 'package:food_delivery_admin_panel/widgets/product_listtile.dart';

import '../../widgets/category_listtile.dart';
import '../../widgets/custom_drawer.dart';

class MenuScreen extends StatelessWidget {
  static const String nameRoute = "MenuScreen";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const MenuScreen(),
        settings: const RouteSettings(name: nameRoute));
  }

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Restourant Menu ",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: Product.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              product: Product.products[index],
                              index: index,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Responsive.isDesktop(context) ||
                              Responsive.isWideDesktop(context)
                          ? Container(
                              constraints: const BoxConstraints(
                                  maxHeight: 1000, minHeight: 300),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: _buildCategories(context)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  //
                                  //
                                  //
                                  Expanded(child: _buildProduct(context)),
                                ],
                              ),
                            )
                          : Container(
                              child: Column(
                                children: [
                                  _buildCategories(context),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  //
                                  //
                                  //
                                  _buildProduct(context),
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        constraints: const BoxConstraints(minHeight: 75),
                        color: Theme.of(context).colorScheme.primary,
                        child: const Text("Some Ad Here"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Responsive.isDesktop(context) || Responsive.isWideDesktop(context)
                ? Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.only(right: 20, bottom: 20, top: 20),
                      color: Theme.of(context).colorScheme.background,
                      child: const Center(child: Text("some ads here ")),
                    ),
                  )
                : const SizedBox()
          ],
        ));
  }

  Container _buildCategories(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
              if (state is CategoriesLoaded) {
                return ReorderableListView(
                  shrinkWrap: true,
                  children: [
                    for (int index = 0;
                        index < state.categories.length;
                        index++,)
                      CategoryListTile(
                        category: state.categories[index],
                        onTap: () {
                          context.read<CategoriesBloc>().add(
                                SelectCategory(
                                    category: state.categories[index]),
                              );
                        },
                        key: ValueKey(state.categories[index].id),
                      ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    context.read<ProductBloc>().add(
                          SortProduct(
                            oldIndex: oldIndex,
                            newIndex: newIndex,
                          ),
                        );
                  },
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
        ],
      ),
    );
  }

  Container _buildProduct(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
              if (state is ProductLoaded) {
                return ReorderableListView(
                  shrinkWrap: true,
                  children: [
                    for (int index = 0; index < state.products.length; index++,)
                      ProductListTile(
                        product: state.products[index],
                        onTap: () {},
                        key: ValueKey(state.products[index].id),
                      ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    context.read<ProductBloc>().add(
                          SortProduct(
                            oldIndex: oldIndex,
                            newIndex: newIndex,
                          ),
                        );
                  },
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
        ],
      ),
    );
  }
}
