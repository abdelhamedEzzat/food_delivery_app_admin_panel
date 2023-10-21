// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:food_delivery_admin_panel/models/product_model.dart';

import 'category_model.dart';
import 'opening_hours_model.dart';

class Restaurant extends Equatable {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? description;
  final List<String>? tags;
  final List<Category>? categories;
  final List<Product>? products;
  final List<OpeningHours>? openingHours;
  // final int deliveryTime;
  // final String priceCategory;
  // final double deliveryFee;
  // final double distance;
  // final Place address;

  const Restaurant({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.tags,
    this.categories,
    this.products,
    this.openingHours,
    // required this.address,
    // this.deliveryTime = 10,
    // this.priceCategory = '\$',
    // this.deliveryFee = 10,
    // this.distance = 15,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        tags,
        categories,
        products,
        openingHours,
      ];

  Restaurant copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? description,
    List<String>? tags,
    List<Category>? categories,
    List<Product>? products,
    List<OpeningHours>? openingHours,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      openingHours: openingHours ?? this.openingHours,
    );
  }

  static List<Restaurant> restaurant = [
    Restaurant(
        categories: Category.categories,
        description: "This is the description ",
        imageUrl:
            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&q=60&w=600&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfHx8MA%3D%3D",
        id: "1",
        name: "golden Ice gelato artiganele",
        openingHours: OpeningHours.openingHourList,
        products: Product.products,
        tags: ["iteland", " dessert"])
  ];
}


// deliveryTime, priceCategory,deliveryFee,  distance,