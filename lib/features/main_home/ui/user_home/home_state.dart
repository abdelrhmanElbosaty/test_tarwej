part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState { }

class HomeCategorySuccess extends HomeState {
 final List<Category> category;

  HomeCategorySuccess(this.category);
}

class HomeCategoryLoading extends HomeState {}

class HomeCategoryError extends HomeState {
  final String errorMessage;

  HomeCategoryError(this.errorMessage);
}