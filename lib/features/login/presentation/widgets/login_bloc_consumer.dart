import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../contacts/presentation/screens/contacts_screen.dart';
import '../../../shared/presentation/widgets/error_widget.dart';
import '../../../shared/presentation/widgets/loader_widget.dart';
import '../blocs/login_bloc.dart';
import '../blocs/login_state.dart';
import 'login_button_widget.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController userController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _userController = userController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _userController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          buildShowErrorDialog(context, state);
        }
        if (state is LoginSuccess) {
          navigateToContacts(context);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return LoaderWidget();
        }
        return buildLoginButtonWidget();
      },
    );
  }

  LoginButtonWidget buildLoginButtonWidget() => LoginButtonWidget(
      formKey: _formKey,
      userController: _userController,
      passwordController: _passwordController);

  Future<dynamic> buildShowErrorDialog(
      BuildContext context, LoginFailure state) {
    return showDialog(
      context: context,
      builder: (context) {
        return ErrorAlertWidget(message: state.message);
      },
    );
  }

  void navigateToContacts(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ContactsScreen()));
    });
  }
}
