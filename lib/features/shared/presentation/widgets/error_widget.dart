import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';

class ErrorAlertWidget extends StatelessWidget {

  final String message;
  const ErrorAlertWidget({
    super.key, required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.translate('ERROR'),style: Theme.of(context).textTheme.labelSmall,),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(AppLocalizations.of(context)!.translate('OK'),style: Theme.of(context).textTheme.labelSmall,),
        ),
      ],
    );
  }
}
