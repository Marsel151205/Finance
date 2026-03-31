import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/themes/dimens.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/income/add_income_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeSources extends StatelessWidget {
  const IncomeSources({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1,
      ),
      itemCount: context.read<AddIncomeBloc>().getIncomeSourcesList().length,
      itemBuilder: (context, index) {
        final isSelected =
            context.read<AddIncomeBloc>().getSelectedCategoryIndex() == index;
        final item = context
            .read<AddIncomeBloc>()
            .getIncomeSourcesList()[index];
        return InkWell(
          borderRadius: BorderRadius.circular(circular12),
          onTap: () {
            context.read<AddIncomeBloc>().setSelectedCategoryIndex(
              isSelected ? null : index,
            );
            context.read<AddIncomeBloc>().setSelectedCategory(item);
          },
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
            decoration: BoxDecoration(
              color: isSelected ? selectedColorPrimary : widgetColorSecondary,
              borderRadius: BorderRadius.circular(circular12),
              border: isSelected
                  ? BoxBorder.all(
                      style: BorderStyle.solid,
                      color: backgroundGreen,
                    )
                  : BoxBorder.all(style: BorderStyle.none),
            ),
            child: Text(item),
          ),
        );
      },
    );
  }
}
