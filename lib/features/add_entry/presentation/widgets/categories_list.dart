import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/themes/dimens.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/expense/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<StatefulWidget> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final items = context.read<ExpenseBloc>().getExpenseCategories();
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(padding12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: 1.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final isSelected = _selectedIndex == index;
        final item = items[index];
        return InkWell(
          borderRadius: BorderRadius.circular(circular12),
          onTap: () {
            setState(() {
              _selectedIndex = isSelected ? null : index;
              context.read<ExpenseBloc>().setSelectedCategory(item.title);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? selectedColorPrimary : widgetColorSecondary,
              borderRadius: BorderRadius.circular(circular12),
              border: isSelected ? BoxBorder.all(style: BorderStyle.solid, color: backgroundRed) : BoxBorder.all(style: BorderStyle.none)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.icon ?? '❔', style: TextStyle(fontSize: textSize18)),
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: textSize12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
