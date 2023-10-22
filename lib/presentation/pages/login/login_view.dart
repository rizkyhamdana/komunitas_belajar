import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/route/app_route.gr.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/presentation/widget/custom_button.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                ),
              ),
              verticalSpacing(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomTextField(
                  labelText: 'Password',
                  textFieldController: passwordController,
                ),
              ),
              verticalSpacing(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomButton(
                  textButton: 'Login',
                  buttonTap: () {
                    context.router.replace(const BasePage());
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
  }
}
