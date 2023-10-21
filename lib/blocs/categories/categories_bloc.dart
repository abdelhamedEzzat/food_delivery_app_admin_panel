import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_admin_panel/models/category_model.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoading()) {
    on<LoadCategory>(_onloadCategory);
    on<SortCategory>(_onSortCategory);
    on<SelectCategory>(_onSelectCategory);
  }

  FutureOr<void> _onloadCategory(
      LoadCategory event, Emitter<CategoryState> emit) {
    Future<void>.delayed(const Duration(seconds: 1));
    emit(CategoryLoaded(
      categories: event.categories,
    ));
  }

  FutureOr<void> _onSortCategory(
      SortCategory event, Emitter<CategoryState> emit) {
    final state = this.state as CategoryLoaded;
    emit(CategoryLoading());
    Future<void>.delayed(const Duration(seconds: 1));
    int newindex =
        (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;
    try {
      Category slectedCategory = state.categories[event.oldIndex];
      List<Category> sortedcategory = List.from(state.categories)
        ..remove(slectedCategory)
        ..insert(newindex, slectedCategory);

      emit(CategoryLoaded(categories: sortedcategory));
    } catch (e) {}
  }

  FutureOr<void> _onSelectCategory(
      SelectCategory event, Emitter<CategoryState> emit) {
    final state = this.state as CategoryLoaded;

    emit(CategoryLoaded(
        categories: state.categories, selectedCategory: event.category));
  }
}
