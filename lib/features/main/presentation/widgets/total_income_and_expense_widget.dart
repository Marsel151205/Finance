import 'package:finance_tracker/core/themes/colors.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/themes/dimens.dart';

class TotalIncomeAndExpenseWidget extends StatelessWidget {
  final Color widgetBackgroundColor;
  final Color textColor;
  final String title;
  final int sum;

  const TotalIncomeAndExpenseWidget({
    super.key,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: textSize16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              sum.toString(),
              style: TextStyle(
                color: textColorPrimary,
                fontSize: textSize18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
