import 'package:flutter/material.dart';

import '../themes/colors.dart';
import '../themes/dimens.dart';

void showMessageSnackBar(BuildContext context, {
  required String title,
  required bool status,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(title),
    duration: Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsetsGeometry.all(padding12),
    backgroundColor: status ? backgroundGreen : backgroundRed,
  ));
}
