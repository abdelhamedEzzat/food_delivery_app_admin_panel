part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductLoading extends ProductState {}

final class ProductLoaded extends ProductState {
  final List<Product> products;

  const ProductLoaded({this.products = const <Product>[]});
  @override
  List<Object> get props => [products];
}
