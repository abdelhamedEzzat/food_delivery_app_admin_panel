part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

final class LoadCategory extends CategoriesEvent {
  final List<Category> categories;

  const LoadCategory({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class SelectCategory extends CategoriesEvent {
  final Category? category;

  const SelectCategory({this.category});
  @override
  List<Object> get props => [category!];
}

final class SortCategory extends CategoriesEvent {
  final int oldIndex;
  final int newIndex;

  const SortCategory({required this.oldIndex, required this.newIndex});
  @override
  List<Object> get props => [oldIndex, newIndex];
}
