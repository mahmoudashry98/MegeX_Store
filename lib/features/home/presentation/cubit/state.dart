abstract class HomeState{}

//InitialState
class HomeInitialState extends HomeState {}

///GetHomeDataState
class GetHomeDataLoadingState extends HomeState {}
class GetHomeDataErrorState extends HomeState {
  // final PrimaryServerException exception;

  // GetHomeDataErrorState({required this.exception});
}
class GetHomeDataLoadedState extends HomeState {}
