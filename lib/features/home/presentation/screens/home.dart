import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/textformfield_search.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context).homeDataModel;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: context.height,
                  color: AppColors.errorColor,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Image.network(cubit.data.products[index].image,
                            fit: BoxFit.contain),
                      );
                    },
                    itemCount: cubit!.data.products.length,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
