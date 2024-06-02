import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/colors.dart';
import '../blocs/login_bloc.dart';
import '../blocs/login_event.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController userController,
    required TextEditingController passwordController,
  }) : _formKey = formKey, _userController = userController, _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _userController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 31,end: 31,top: 32),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: primaryShadowColor,
              offset: Offset(0, 2),
              blurRadius: 12,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final user = _userController.text;
              final password = _passwordController.text;
              context.read<LoginBloc>().add(getLoginEvent(user, password));
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: labelColor,
          ),
          child: Text(
            AppLocalizations.of(context)!.translate('login'),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: whiteColor),
          ),
        ),
      ),
    );
  }
}
