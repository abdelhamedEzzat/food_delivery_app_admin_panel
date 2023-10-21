part of 'categories_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

final class LoadCategory extends CategoryEvent {
  final List<Category> categories;

  const LoadCategory({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class SelectCategory extends CategoryEvent {
  final Category? category;

  const SelectCategory(Category categori, {this.category});
  @override
  List<Object> get props => [category!];
}

final class SortCategory extends CategoryEvent {
  final int oldIndex;
  final int newIndex;

  const SortCategory({required this.oldIndex, required this.newIndex});
  @override
  List<Object> get props => [oldIndex, newIndex];
}
