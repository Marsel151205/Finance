import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/themes/dimens.dart';
import 'package:finance_tracker/core/utils/loading_overlay.dart';
import 'package:finance_tracker/core/utils/message_snack_bar.dart';
import 'package:finance_tracker/core/widgets/amount_input_field.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/expense/expense_event.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/expense/expense_state.dart';
import 'package:finance_tracker/features/add_entry/presentation/widgets/categories_list.dart';
import 'package:finance_tracker/features/add_entry/presentation/widgets/comment_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/expense/expense_bloc.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  bool isUnnecessary = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpenseBloc, ExpenseState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: paddingLeft10, right: paddingRight10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 12),
                Text(
                  'Сумма',
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: textSize16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AmountInputField(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Категории',
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: textSize16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 250, child: CategoriesList()),
                Container(
                  padding: EdgeInsets.all(padding12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: widgetColorSecondary,
                    border: Border.all(width: 1, color: strokeColorPrimary),
                    borderRadius: BorderRadiusDirectional.circular(circular12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('⚠️', style: TextStyle(fontSize: textSize18)),
                      SizedBox(width: width12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ненужный расход',
                            style: TextStyle(
                              color: textColorPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: textSize14,
                            ),
                          ),
                          Text(
                            'Отметить как лишнюю трату',
                            style: TextStyle(
                              color: secondaryTextColor,
                              fontSize: textSize10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Switch(
                        value: isUnnecessary,
                        onChanged: (value) {
                          setState(() {
                            isUnnecessary = value;
                          });
                        },
                        activeColor: widgetColorPrimary,
                        inactiveTrackColor: widgetColorSecondary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Комментарий',
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: textSize16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: height12),
                CommentInputField(),
                SizedBox(height: height12),
                ElevatedButton(
                  onPressed: () {
                    context.read<ExpenseBloc>().add(
                      SaveExpenseEvent(isUnnecessary),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 0),
                    padding: EdgeInsets.only(
                      top: paddingTop16,
                      bottom: paddingBottom16,
                    ),
                    elevation: 1,
                    backgroundColor: widgetColorSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(circular12),
                    ),
                  ),
                  child: Text(
                    'Сохранить расход',
                    style: TextStyle(
                      color: textColorPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: textSize16,
                    ),
                  ),
                ),
                SizedBox(height: height12),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoadingExpenseState) LoadingOverlay.show(context);
        if (state is SuccessExpenseState) {
          LoadingOverlay.hide();
          showMessageSnackBar(
            context,
            title: 'Расход успешно добавлен',
            status: true,
          );
        }
        if (state is ErrorExpenseState) {
          LoadingOverlay.hide();
          showMessageSnackBar(
            context,
            title: state.errorMessage,
            status: false,
          );
        }
      },
    );
  }
}
