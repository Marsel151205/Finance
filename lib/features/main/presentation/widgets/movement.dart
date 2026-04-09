import 'package:finance_tracker/core/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/dimens.dart';
import '../../../../shared/income_and_expense/presentation/models/expense_model.dart';
import '../../../../shared/income_and_expense/presentation/models/income_model.dart';

class Movement extends StatelessWidget {
  final ExpenseModelUi? model;
  final IncomeModelUi? incomeModel;

  const Movement({super.key, this.model, this.incomeModel});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: surfaceColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (model != null ? model?.sum : incomeModel?.sum).toString(),
              style: TextStyle(
                color: textColorPrimary,
                fontSize: textSize20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              (model != null ? model?.category : incomeModel?.category)
                  .toString(),
              style: TextStyle(
                color: textColorPrimary,
                fontSize: textSize18,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              (model != null ? model?.comment : incomeModel?.comment)
                  .toString(),
              style: TextStyle(
                color: textColorSecondary,
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
