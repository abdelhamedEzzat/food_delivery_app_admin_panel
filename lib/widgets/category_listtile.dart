// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_delivery_admin_panel/models/category_model.dart';

class CategoryListTile extends StatelessWidget {
  final Category category;
  final void Function()? onTap;
  const CategoryListTile({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        category.imageUrl,
        height: 25,
      ),
      title: Text(
        category.name,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        category.description,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      // trailing: const Icon(Icons.menu),
    );
  }
}
