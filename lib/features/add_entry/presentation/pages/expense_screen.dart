import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/themes/dimens.dart';
import 'package:finance_tracker/core/widgets/amount_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: paddingLeft10, right: paddingRight10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 12),
              Text(
                'Сумма',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: textSize14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              AmountInputField(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Категории',
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: textSize14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
