import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/colors.dart';


class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: primaryShadowColor,
            offset: Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                AppLocalizations.of(context)!.translate('use'),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),

            Image.asset('assets/images/google.png', height: 25, width: 25),
          ],
        ),
      ),
    );
  }
}
