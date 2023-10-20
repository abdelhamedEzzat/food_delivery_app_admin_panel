import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_admin_panel/models/category_model.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesLoading()) {
    on<LoadCategory>(_onloadCategory);
    on<SortCategory>(_onSortCategory);
    on<SelectCategory>(_onSelectCategory);
  }

  FutureOr<void> _onloadCategory(
      LoadCategory event, Emitter<CategoriesState> emit) {
    Future<void>.delayed(const Duration(seconds: 1));
    emit(CategoriesLoaded(
      categories: event.categories,
    ));
  }

  FutureOr<void> _onSortCategory(
      SortCategory event, Emitter<CategoriesState> emit) {
    final state = this.state as CategoriesLoaded;
    emit(CategoriesLoading());
    Future<void>.delayed(const Duration(seconds: 1));
    int newindex =
        (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;
    try {
      Category slectedCategory = state.categories[event.oldIndex];
      List<Category> sortedcategory = List.from(state.categories)
        ..remove(slectedCategory)
        ..insert(newindex, slectedCategory);

      emit(CategoriesLoaded(categories: sortedcategory));
    } catch (e) {}
  }

  FutureOr<void> _onSelectCategory(
      SelectCategory event, Emitter<CategoriesState> emit) {
    final state = this.state as CategoriesLoaded;

    emit(CategoriesLoaded(
        categories: state.categories, selectedCategory: event.category));
  }
}
