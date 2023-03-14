abstract class CategoriesState {}

//InitialState
class CategoriesInitialState extends CategoriesState {}

///GetCategoriesDataState
class GetCategoriesLoadingState extends CategoriesState {}

class GetCategoriesDataErrorState extends CategoriesState {
  final String messageError;

  GetCategoriesDataErrorState({required this.messageError});
}

class GetCategoriesDataLoadedState extends CategoriesState {}


