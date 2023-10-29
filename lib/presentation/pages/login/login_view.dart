import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:komunitas_belajar/config/route/app_route.gr.dart';
import 'package:komunitas_belajar/config/services/injection.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/presentation/pages/login/login_cubit.dart';
import 'package:komunitas_belajar/presentation/pages/login/login_state.dart';
import 'package:komunitas_belajar/presentation/widget/custom_button.dart';
import 'package:komunitas_belajar/presentation/widget/custom_suffix_icon.dart';
import 'package:komunitas_belajar/presentation/widget/custom_text_field.dart';
import 'package:komunitas_belajar/presentation/widget/spacing.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var cubit = getIt<LoginCubit>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is LoginLoading) {
            EasyLoading.show();
          } else if (state is LoginLoaded) {
            EasyLoading.dismiss();
            context.router.replace(const BasePage());
          }
          if (state is LoginError) {
            EasyLoading.dismiss();
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Error',
              desc: state.error,
            ).show();
          }
        },
        builder: (context, state) {
          return Container(
            color: AppTheme.bgColor,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 100,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Hero(
                      tag: 'logo_app',
                      child: Image.asset(
                        'assets/images/ic_logo_app2.png',
                        height: 120,
                      ),
                    ),
                    verticalSpacing(48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomTextField(
                        labelText: 'Username',
                        textFieldController: userNameController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Field username tidak boleh kosong';
                          }
                          return null;
                        },
                        onChanged: (p0) {
                          _formKey.currentState!.validate();

                          setState(() {});
                        },
                      ),
                    ),
                    verticalSpacing(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomTextField(
                        labelText: 'Password',
                        textFieldController: passwordController,
                        obscureText: obscureText,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Field password tidak boleh kosong';
                          }
                          return null;
                        },
                        suffixIcon: CustomSuffixIcon(
                          obscureText: obscureText,
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                        onChanged: (p0) {
                          _formKey.currentState!.validate();

                          setState(() {});
                        },
                      ),
                    ),
                    verticalSpacing(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomButton(
                        textButton: 'Login',
                        buttonTap: () {
                          if (userNameController.text == '' ||
                              passwordController.text == '') {
                            _formKey.currentState!.validate();
                          } else {
                            // cubit.login(userNameController.text,
                            //     passwordController.text);
                            context.router.replace(const BasePage());
                          }
                        },
                      ),
                    ),
                    verticalSpacing(),
                    Text(
                      'Lupa password?',
                      style: AppTheme.subtitle3(
                          color: AppTheme.blackColor2,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
