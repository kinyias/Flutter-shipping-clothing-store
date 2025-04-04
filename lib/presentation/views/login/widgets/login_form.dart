import 'package:shipping_clothing_store/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_clothing_store/core/utils/localization/app_localization.dart';
import 'package:shipping_clothing_store/core/utils/validators/valication.dart';
import 'package:shipping_clothing_store/core/constants/sizes.dart';
import 'package:shipping_clothing_store/presentation/viewmodels/login/login_bloc.dart';
// import 'package:shipping_clothing_store/presentation/views/signup/signup.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get_storage/get_storage.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final storage = GetStorage(); //tạo GetStorage 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          // ✅ Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        } else if (state is LoginSuccess) {
          // Lưu token vào GetStorage khi đăng nhập thành công
          storage.write('auth_token', state.token);
          // ✅ Navigate to HomeScreen on success
          Navigator.pushReplacementNamed(context, '/home');
        }
      },
      builder: (context, state) {
         if (state is LoginSuccess) {
              return NavigationMenu();  
            }
        return Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
            child: Column(
              children: [
                // Email Field
                TextFormField(
                  controller: emailController,
                  validator: (value) =>
                      CValidator.validateEmail(context, value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: AppLocalizations.of(context)!.translate('email'),
                  ),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),

                // Password Field
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: passwordController,
                      validator: (value) =>
                          CValidator.validatePassword(context, value),
                      obscureText: state.isPasswordHidden,
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context)!.translate('password'),
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          icon: Icon(state.isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                LoginPasswordVisibilityToggled()); // ✅ Toggle password
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields / 2),

                // Remember Me & Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Remember Me Checkbox

                    Row(
                      children: [
                        Checkbox(
                          value: state.isRemembered,
                          onChanged: (value) {
                            context
                                .read<LoginBloc>()
                                .add(LoginRememberMeToggled());
                          },
                        ),
                        Text(AppLocalizations.of(context)!
                            .translate('rememberMe')),
                      ],
                    ),

                    // Forgot Password Button
                    TextButton(
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!
                          .translate('forgetPassword')),
                    ),
                  ],
                ),

                const SizedBox(height: CSizes.spaceBtwSections),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(
                              LoginSubmitted(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
                    },
                    child:
                        Text(AppLocalizations.of(context)!.translate('signIn')),
                  ),
                ),

                const SizedBox(height: CSizes.spaceBtwItems),

            
                // Show Loading Indicator
                if (state is LoginLoading) const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
