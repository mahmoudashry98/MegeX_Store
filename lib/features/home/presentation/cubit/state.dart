abstract class HomeState{}

//InitialState
class HomeInitialState extends HomeState {}

///GetHomeDataState
class GetHomeDataLoadingState extends HomeState {}
class GetHomeDataErrorState extends HomeState {
  final String messageError;

  GetHomeDataErrorState({required this.messageError});
}
class GetHomeDataLoadedState extends HomeState {}
