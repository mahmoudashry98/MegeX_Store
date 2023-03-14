import 'package:e_commerce_app/core/base_usecase/base_usecase.dart';
import 'package:e_commerce_app/features/caregories/domain/entities/category.dart';
import 'package:e_commerce_app/features/caregories/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/category_usecase.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoryUseCase getCategoryStateUseCase;

  CategoriesCubit({required this.getCategoryStateUseCase})
      : super(CategoriesInitialState());

  static CategoriesCubit get(context) =>
      BlocProvider.of<CategoriesCubit>(context);

  CategoryEntities? categoryModel;

  Future<void> getCategoriesData() async {
    emit(GetCategoriesLoadingState());
    print('i.m here');
    var response = await getCategoryStateUseCase(const NoParemeters());

    response.fold(
      (l) {
        print('Error ${l.message}');
        emit(GetCategoriesDataErrorState(messageError: l.message));
      },
      (r) {
        print("GET CategoriesCubit");
        categoryModel = r;
        emit(GetCategoriesDataLoadedState());
      },
    );
  }
}
