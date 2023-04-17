abstract class HomeState {}

//InitialState
class HomeInitialState extends HomeState {}

//Change TabBar
class ChangeTabBarState extends HomeState {}

//Change TabBar
class ChangeBottomNavBarState extends HomeState {}

///GetHomeDataState
class GetHomeDataLoadingState extends HomeState {}

class GetHomeDataErrorState extends HomeState {
  final String messageError;

  GetHomeDataErrorState({required this.messageError});
}

class GetHomeDataLoadedState extends HomeState {}

//SearchProductsState

class GetSearchProductsLoadingState extends HomeState {}

class GetSearchProductsErrorState extends HomeState {}

class GetSearchProductsLoadedState extends HomeState {}

//IsSearchingState
class IsSearchingLoadingState extends HomeState {}

class IsSearchingLoadedState extends HomeState {}
