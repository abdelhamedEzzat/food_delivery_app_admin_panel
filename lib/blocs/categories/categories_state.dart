part of 'categories_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

final class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  final Category? selectedCategory;

  const CategoryLoaded({
    this.categories = const <Category>[],
    this.selectedCategory,
  });

  @override
  List<Object?> get props => [categories, selectedCategory];
}





// final class CategoriesLoaded extends CategoriesState {
//   final List<Category> categories;
//   final Category? selectCategory;

//   const CategoriesLoaded(
//      {this.selectCategory,
//     this.categories = const <Category>[],
//   });
//   @override
//   List<Object> get props => [categories, selectCategory!];
// }
