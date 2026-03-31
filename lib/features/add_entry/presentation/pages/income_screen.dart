import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/themes/dimens.dart';
import 'package:finance_tracker/core/utils/loading_overlay.dart';
import 'package:finance_tracker/core/utils/message_snack_bar.dart';
import 'package:finance_tracker/features/add_entry/presentation/widgets/categories_list.dart';
import 'package:finance_tracker/features/add_entry/presentation/widgets/income_sources.dart';
import 'package:finance_tracker/shared/presentation/widgets/amount_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/income/add_income_bloc.dart';
import '../bloc/income/add_income_state.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddIncomeBloc, AddIncomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsetsGeometry.only(
            left: paddingLeft10,
            right: paddingRight10,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height12),
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
                SizedBox(
                  height: 250,
                  child: CategoriesList(
                    expenseList: context
                        .read<AddIncomeBloc>()
                        .getCategoriesList(),
                    onCategorySelected: (category) => context
                        .read<AddIncomeBloc>()
                        .setSelectedCategory(category),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Источник дохода',
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: textSize16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 150, child: IncomeSources()),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoadingAddIncomeState) LoadingOverlay.show(context);
        if (state is ErrorAddIncomeState) {
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
