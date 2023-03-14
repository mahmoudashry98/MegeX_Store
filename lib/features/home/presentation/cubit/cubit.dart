import 'package:e_commerce_app/core/base_usecase/base_usecase.dart';
import 'package:e_commerce_app/features/home/domain/entities/home.dart';
import 'package:e_commerce_app/features/home/domain/usecase/home.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  HomeCubit({required this.getHomeDataUseCase}) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

//CurrentIndex
  int currentIndex = 0;

//List of Item in TabBar
  List<String> items = [
    'Wearable',
    'Laptops',
    'Phones',
    'Drones',
  ];

  void changeTabBar(int index) {
    currentIndex = index;
    emit(ChangeTabBarState());
  }

  HomeEntities? homeDataModel;

  Future<void> getHomeData() async {
    emit(GetHomeDataLoadingState());

    var response = await getHomeDataUseCase(const NoParemeters());

    response.fold(
      (l) {
        print('Error ${l.message}');
        emit(GetHomeDataErrorState(messageError: l.message));
      },
      (r) {
        homeDataModel = r;
        //print('ProductModel $homeDataModel');
        emit(GetHomeDataLoadedState());
      },
    );
  }
}
