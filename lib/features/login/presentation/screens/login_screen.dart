import '../../../../core/theme/colors.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/login_bloc.dart';
import '../widgets/google_button_widget.dart';
import '../widgets/login_bloc_consumer.dart';
import '../widgets/have_account_widget.dart';
import '../widgets/or_widget.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [babyBlueTop ,whiteColor]
              )
            ),
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 49, right: 49),
                      child: Image.asset('assets/images/logo.png', height: 161.57, width: 291.2),
                    ),
                    SizedBox(height: 63.34),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: const GoogleButtonWidget(),
                    ),
                    SizedBox(height: 15.0),
                    const OrWidget(),
                    SizedBox(height: 16),
                    TextFieldWidget(userController: _userController, passwordController: _passwordController),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 33),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(AppLocalizations.of(context)!.translate('forgot_password'),style: Theme.of(context).textTheme.labelSmall,),
                      ),
                    ),
                     LoginBlocConsumer(formKey: _formKey, userController: _userController, passwordController: _passwordController),
                     const HaveAccountWidget(),
                    SizedBox(height: 60),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





