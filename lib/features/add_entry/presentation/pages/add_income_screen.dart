import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/themes/dimens.dart';
import 'package:finance_tracker/core/utils/loading_overlay.dart';
import 'package:finance_tracker/core/utils/message_snack_bar.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/income/add_income_event.dart';
import 'package:finance_tracker/features/add_entry/presentation/widgets/comment_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/income_and_expense/presentation/widgets/amount_input_field.dart';
import '../bloc/income/add_income_bloc.dart';
import '../bloc/income/add_income_state.dart';
import '../widgets/categories_list.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddIncomeBloc, AddIncomeState>(
      buildWhen: (previous, current) =>
          current is! SuccessAddIncomeState &&
          current is! LoadingAddIncomeState,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: paddingLeft10, right: paddingRight10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height12),
                Text(
                  'Сумма',
                  style: TextStyle(
                    color: textColorSecondary,
                    fontSize: textSize16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AmountInputField(
                  onInputAmount: (value) =>
                      context.read<AddIncomeBloc>().setSum(value),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Источник дохода',
                    style: TextStyle(
                      color: textColorSecondary,
                      fontSize: textSize16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (state is SuccessUploadIncomeCategoriesState) ...[
                  SizedBox(
                    height: 220,
                    child: CategoriesList(
                      expenseList: state.categories,
                      onCategorySelected: (category) => context
                          .read<AddIncomeBloc>()
                          .setSelectedCategory(category),
                    ),
                  ),
                ],
                SizedBox(height: height12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Комментарий',
                    style: TextStyle(
                      color: textColorSecondary,
                      fontSize: textSize16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: height12),
                CommentInputField(
                  onChangeComment: (value) =>
                      context.read<AddIncomeBloc>().setComment(value),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<AddIncomeBloc>().add(SaveIncomeEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 0),
                    padding: EdgeInsets.only(
                      top: paddingTop16,
                      bottom: paddingBottom16,
                    ),
                    elevation: 1,
                    backgroundColor: primaryButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(circular12),
                    ),
                  ),
                  child: Text(
                    'Добавить доход',
                    style: TextStyle(
                      color: buttonTextColor,
                      fontWeight: FontWeight.w700,
                      fontSize: textSize18,
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
        if (state is LoadingAddIncomeState) LoadingOverlay.show(context);
        if (state is! LoadingAddIncomeState) LoadingOverlay.hide();
        if (state is ErrorAddIncomeState) {
          showMessageSnackBar(
            context,
            title: state.errorMessage,
            status: false,
          );
        }
        if (state is SuccessAddIncomeState) {
          showMessageSnackBar(
            context,
            title: 'Доход успешно сохранен',
            status: true,
          );
        }
      },
    );
  }
}
