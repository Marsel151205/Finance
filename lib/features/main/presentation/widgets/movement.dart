import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/shared/presentation/models/expense_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/dimens.dart';

class Movement extends StatelessWidget {
  final ExpenseModelUi model;

  const Movement({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: widgetColorSecondary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.sum.toString(),
              style: TextStyle(
                color: textColorPrimary,
                fontSize: textSize20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              model.category.toString(),
              style: TextStyle(
                color: textColorPrimary,
                fontSize: textSize18,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              model.comment.toString(),
              style: TextStyle(
                color: secondaryTextColor,
                fontSize: textSize16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
