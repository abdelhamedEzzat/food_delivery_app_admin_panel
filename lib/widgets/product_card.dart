import 'package:flutter/material.dart';
import 'package:food_delivery_admin_panel/models/product_model.dart';

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
                    onPressed: () {},
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
