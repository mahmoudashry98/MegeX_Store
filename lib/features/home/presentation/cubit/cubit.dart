import 'package:e_commerce_app/core/base_usecase/base_usecase.dart';
import 'package:e_commerce_app/features/home/domain/entities/home.dart';
import 'package:e_commerce_app/features/home/domain/usecase/home.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  HomeCubit({required this.getHomeDataUseCase}) : super(HomeInitialState());

    static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);


  HomeEntities? homeDataModel;

  Future<void> getHomeData() async {
    emit(GetHomeDataLoadingState());

    var response = await getHomeDataUseCase(const NoParemeters());

    response.fold(
      (l) => emit(GetHomeDataErrorState()),
      (r) {
        homeDataModel = r;
        emit(GetHomeDataLoadedState());
      },
    );
  }
}
