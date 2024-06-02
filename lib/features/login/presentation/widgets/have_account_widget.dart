import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/colors.dart';


class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child:
    Padding(
      padding: const EdgeInsetsDirectional.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.translate('no_account'),style: Theme.of(context).textTheme.labelSmall?.copyWith(color: grayColor),),
          SizedBox(width: 5),
          InkWell(
            child: RichText(
              text: TextSpan(
                text: AppLocalizations.of(context)!.translate('create_account'),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: labelColor,
                  decoration: TextDecoration.underline,
                  decorationColor: labelColor,
                ),
              ),
            ),
          )
        ],
      ),
    ),);
  }
}
