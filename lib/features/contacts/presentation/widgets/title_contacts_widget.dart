import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';

class TitleContactsWidget extends StatelessWidget {
  const TitleContactsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 59),
          child: Image.asset('assets/images/robot_logo.png',width: 141.52,height: 141.52,),
        ),
        Text(AppLocalizations.of(context)!.translate('ask_about_lecture'),style: Theme.of(context).textTheme.titleMedium,)                  ],

    );
  }
}
