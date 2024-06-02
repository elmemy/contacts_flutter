import 'package:flutter/material.dart';
import '../../../shared/presentation/widgets/text_form_field_widget.dart';


class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required TextEditingController userController,
    required TextEditingController passwordController,
  })  : _userController = userController,
        _passwordController = passwordController;

  final TextEditingController _userController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31.0),
      child: Column(
        children: [
          TextFormFieldWidget(controller: _userController, title: 'username', validation: 'user_name_required'),
          SizedBox(height: 10),
          TextFormFieldWidget(controller: _passwordController, title: 'password', validation: 'password_required',isPassword: true),
        ],
      ),
    );
  }
}

