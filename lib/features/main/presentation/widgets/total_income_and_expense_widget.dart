import 'package:finance_tracker/core/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/dimens.dart';

class TotalIncomeAndExpenseWidget extends StatelessWidget {
  final bool isExpense;
  final Color widgetBackgroundColor;
  final Color textColor;
  final String title;
  final int sum;

  const TotalIncomeAndExpenseWidget({
    super.key,
    required this.isExpense,
    required this.widgetBackgroundColor,
    required this.textColor,
    required this.title,
    required this.sum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widgetBackgroundColor,
        borderRadius: BorderRadius.circular(circular12),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: paddingLeft16,
          right: paddingRight16,
          top: paddingTop10,
          bottom: paddingBottom10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isExpense ? expenseBackground : incomeBackground,
                borderRadius: BorderRadius.circular(circular100),
              ),
              child: isExpense
                  ? Padding(
                      padding: EdgeInsets.all(padding8),
                      child: Icon(
                        Icons.south_west,
                        color: expenseWidgetTextColor,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(padding8),
                      child: Icon(
                        Icons.north_east,
                        color: incomeWidgetTextColor,
                      ),
                    ),
            ),
            SizedBox(width: width12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: textSize14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  sum.toString(),
                  style: TextStyle(
                    color: textColorPrimary,
                    fontSize: textSize20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
