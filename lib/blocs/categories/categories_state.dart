part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object?> get props => [];
}

final class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Category> categories;
  final Category? selectedCategory;

  const CategoriesLoaded({
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
