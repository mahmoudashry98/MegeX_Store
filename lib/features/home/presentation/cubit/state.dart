abstract class HomeState {}

//InitialState
class HomeInitialState extends HomeState {}

//Change TabBar
class ChangeTabBarState extends HomeState {}

//Change TabBar
class ChangeBottomNavBarState extends HomeState {}

//Change Expanded
class ChangeExpandedState extends HomeState {}

//Change CarouselIndector
class ChangeCarouselIndectorState extends HomeState {}

//Get HomeDataState
class GetHomeDataLoadingState extends HomeState {}

class GetHomeDataLoadedState extends HomeState {}

class GetHomeDataErrorState extends HomeState {
  final String messageError;

  GetHomeDataErrorState({required this.messageError});
}


//Search ProductsState

class GetSearchProductsLoadingState extends HomeState {}

class GetSearchProductsErrorState extends HomeState {}

class GetSearchProductsLoadedState extends HomeState {}

//Is SearchingState
class IsSearchingLoadingState extends HomeState {}

class IsSearchingLoadedState extends HomeState {}
