import '../../../../core/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String validation;
  final bool? isPassword;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.validation,
    this.isPassword,
  });

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.translate(widget.title),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          style: Theme.of(context).textTheme.titleSmall,
          obscureText: widget.isPassword == true ? !_isPasswordVisible : false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.0,
              ),
            ),
            errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: Colors.red,overflow: TextOverflow.ellipsis,),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.0,
              ),
            ),
            suffixIcon: widget.isPassword == true
                ? IconButton(
              icon: !_isPasswordVisible ? Image.asset('assets/images/open-eye.png',width: 17.59,height: 12.1) :
              Icon(
                Icons.visibility_off,
                color: primaryColor,
                size: 17.59,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )
                : SizedBox(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13.0),
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.0,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.translate(widget.validation);
            }
            if (widget.isPassword == true) {
              if (value.length < 8) {
                return AppLocalizations.of(context)!.translate('password_too_short');
              }
              if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                return AppLocalizations.of(context)!.translate('password_must_contain_uppercase');
              }
              if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                return AppLocalizations.of(context)!.translate('password_must_contain_lowercase');
              }
              if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                return AppLocalizations.of(context)!.translate('password_must_contain_number');
              }
              if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
                return AppLocalizations.of(context)!.translate('password_must_contain_special');
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
