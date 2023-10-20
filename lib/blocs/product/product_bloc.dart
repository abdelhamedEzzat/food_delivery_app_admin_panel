// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_admin_panel/blocs/categories/categories_bloc.dart';
import 'package:food_delivery_admin_panel/models/category_model.dart';
import 'package:food_delivery_admin_panel/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final CategoriesBloc _categorybloc;
  StreamSubscription? _categorySubscription;
  ProductBloc({
    required CategoriesBloc categorybloc,
  })  : _categorybloc = categorybloc,
        super(ProductLoading()) {
    on<LoadProduct>(_onLoadProduct);
    on<UpdateProduct>(_onUpdateProduct);
    on<SortProduct>(_onSortProduct);

    _categorySubscription = _categorybloc.stream.listen((state) {
      if (state is CategoriesLoaded && state.selectedCategory != null) {
        add(UpdateProduct(category: state.selectedCategory!));
      }
    });
  }

  FutureOr<void> _onLoadProduct(
      LoadProduct event, Emitter<ProductState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(ProductLoaded(products: event.products));
  }

  FutureOr<void> _onUpdateProduct(
      UpdateProduct event, Emitter<ProductState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    List<Product> filteredProduct = Product.products
        .where((product) => product.category == event.category.name)
        .toList();
    emit(ProductLoaded(products: filteredProduct));
  }

  FutureOr<void> _onSortProduct(
      SortProduct event, Emitter<ProductState> emit) {}
}
