import 'package:e_commerce_app/features/auth/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          debugPrint(state.exception.message.toString());
          debugPrint(state.exception.error.toString());
          debugPrint(state.exception.code.toString());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
              child: TextButton(
                  onPressed: () {
                    AuthCubit.get(context).login(
                      email: 'mahmoud.osama@gmail.com',
                      password: '123456',
                    );
                  },
                  child: Text('Login'))),
        );
      },
    );
  }
}
