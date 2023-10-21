import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin_panel/blocs/product/product_bloc.dart';
import 'package:food_delivery_admin_panel/models/category_model.dart';
import 'package:food_delivery_admin_panel/models/product_model.dart';
import 'package:food_delivery_admin_panel/widgets/custom_dropdown_button.dart';
import 'package:food_delivery_admin_panel/widgets/custom_text_form_field.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.index});
  final Product product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(5.0)),
      child: (index == 0)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          Product product = Product(
                            name: "",
                            category: "",
                            description: "",
                            imageUrl: "",
                            price: 0,
                          );
                          return Dialog(
                            child: Container(
                              height: 450,
                              width: 500,
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    "Add Prodauct",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomDropdownButton(
                                    items: Category.categories
                                        .map((category) => category.name)
                                        .toList(),
                                    onChanged: (value) {
                                      product =
                                          product.copyWith(category: value);
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFormField(
                                      maxLines: 1,
                                      title: "name",
                                      hasTitle: true,
                                      initialValue: "",
                                      onChanged: (value) {
                                        product = product.copyWith(name: value);
                                      }),
                                  CustomTextFormField(
                                      maxLines: 1,
                                      title: "price",
                                      hasTitle: true,
                                      initialValue: "",
                                      onChanged: (value) {
                                        product = product.copyWith(
                                            price: double.parse(value));
                                      }),
                                  CustomTextFormField(
                                      maxLines: 1,
                                      title: "Image URL",
                                      hasTitle: true,
                                      initialValue: "",
                                      onChanged: (value) {
                                        product =
                                            product.copyWith(imageUrl: value);
                                      }),
                                  CustomTextFormField(
                                      maxLines: 3,
                                      title: "Description",
                                      hasTitle: true,
                                      initialValue: "",
                                      onChanged: (value) {
                                        product = product.copyWith(
                                            description: value);
                                      }),
                                  ElevatedButton(
                                      onPressed: () {
                                        BlocProvider.of<ProductBloc>(context)
                                            .add(AddProduct(product: product));
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Save",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ))
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    iconSize: 40,
                    icon: Icon(
                      Icons.add_circle,
                      color: Theme.of(context).colorScheme.primary,
                    )),
                Text("Add a Product",
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(product.imageUrl),
                ),
                Text(product.name,
                    style: Theme.of(context).textTheme.headlineSmall),
                Text("\$${product.name}",
                    style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
    );
  }
}
