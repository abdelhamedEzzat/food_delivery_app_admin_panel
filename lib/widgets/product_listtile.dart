// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery_admin_panel/models/product_model.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  final void Function()? onTap;

  const ProductListTile({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl)),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        product.description,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      // trailing: const Icon(Icons.menu),
    );
  }
}
