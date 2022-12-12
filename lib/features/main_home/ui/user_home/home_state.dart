
part of 'home_cubit.dart';

// old way
// abstract class HomeState {
//   const HomeState();
// }
//
// class HomeInitial extends HomeState { }
//
// class HomeCategorySuccess extends HomeState {
//  final List<Category> category;
//
//   HomeCategorySuccess(this.category);
// }
//
// class HomeCategoryLoading extends HomeState {}
//
// class HomeCategoryError extends HomeState {
//   final String errorMessage;
//
//   HomeCategoryError(this.errorMessage);
// }
//
// class HomeFeaturedStoresSuccess extends HomeState {
//   final List<Store> store;
//
//   HomeFeaturedStoresSuccess(this.store);
// }
//
// class HomeFeaturedStoresLoading extends HomeState {}
//
// class HomeFeaturedStoresError extends HomeState {
//   final String errorMessage;
//
//   HomeFeaturedStoresError(this.errorMessage);
// }

class HomeState extends Equatable {

  final String? errorMessage;
  final Async<List<Category>> category;
  final Async<List<s.Store>> store;
  final Async<List<Ads>> ads;

  const HomeState(this.errorMessage, this.category, this.store, this.ads);

  const HomeState.initial()
      : this(
    null,
    const Async.initial(),
    const Async.initial(),
    const Async.initial(),
  );

  HomeState reduce({
    String? errorMessage,
    Async<List<Category>>? category,
    Async<List<s.Store>>? store,
    Async<List<Ads>>? ads,
  }) {
    return HomeState(
      errorMessage,
      category ?? this.category,
      store ?? this.store,
      ads ?? this.ads,
    );
  }

  HomeState reduceToFailures({String? errorMessage}) {
    return HomeState(
      errorMessage,
      category.isLoading ? const Async.failure("Error") : category,
      store.isLoading ? const Async.failure("Error") : store,
      ads.isLoading ? const Async.failure("Error") : ads,
    );
  }

  @override
  List<Object?> get props => [errorMessage,category,store,ads];
}