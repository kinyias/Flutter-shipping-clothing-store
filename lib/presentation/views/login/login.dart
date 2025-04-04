import 'package:shipping_clothing_store/data/auth/repositories/auth_repository.dart';
import 'package:shipping_clothing_store/domain/auth/usecases/login_usecase.dart';
import 'package:shipping_clothing_store/data/auth/sources/auth_api.dart';
import 'package:shipping_clothing_store/presentation/viewmodels/login/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shipping_clothing_store/presentation/views/login/widgets/login_form.dart';
import 'package:shipping_clothing_store/presentation/views/login/widgets/login_header.dart';
import 'package:shipping_clothing_store/core/utils/helpers/helper_functions.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/core/utils/localization/app_localization.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          final loginBloc = LoginBloc(
            loginUseCase: LoginUseCase(AuthRepositoryImpl(AuthApi())),
          );

          // ✅ Dispatch CheckAutoLogin when bloc is initialized
          loginBloc.add(CheckAutoLogin());

          return loginBloc;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const LoginHeader(),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
