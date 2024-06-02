import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/colors.dart';


class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 148,
            height: 1,
            color: grayColor.withOpacity(0.12),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                AppLocalizations.of(context)!.translate('or'),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: grayColor),
              )
          ),
          Container(
            width: 148,
            height: 1,
            color: grayColor.withOpacity(0.12),
          ),
        ],
      ),
    );
  }
}


