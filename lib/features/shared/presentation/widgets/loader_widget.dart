import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: labelColor,));
  }
}
