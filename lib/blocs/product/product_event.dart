// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProduct extends ProductEvent {
  final List<Product> products;
  const LoadProduct({this.products = const <Product>[]});
  @override
  List<Object> get props => [Product];
}

class UpdateProduct extends ProductEvent {
  final Category category;
  const UpdateProduct({
    required this.category,
  });
  @override
  List<Object> get props => [category];
}

class AddProduct extends ProductEvent {
  final Product product;

  const AddProduct({required this.product});

  @override
  List<Object> get props => [product];
}

final class SortProduct extends ProductEvent {
  final int oldIndex;
  final int newIndex;

  const SortProduct({required this.oldIndex, required this.newIndex});
  @override
  List<Object> get props => [oldIndex, newIndex];
}
