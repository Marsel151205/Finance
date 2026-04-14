import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/themes/dimens.dart';
import 'package:finance_tracker/shared/category/presentation/models/category_model_ui.dart';
import 'package:flutter/material.dart';

import '../../../../shared/category/domain/entities/expense_category_entity.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key,
    required this.expenseList,
    required this.onCategorySelected,
    this.initialSelectedIndex,
  });

  final List<CategoryModelUi> expenseList;
  final ValueChanged<String> onCategorySelected;
  final int? initialSelectedIndex;

  @override
  State<StatefulWidget> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(padding12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: 0.8,
      ),
      itemCount: widget.expenseList.length,
      itemBuilder: (context, index) {
        final isSelected = _selectedIndex == index;
        final item = widget.expenseList[index];
        return InkWell(
          borderRadius: BorderRadius.circular(circular12),
          onTap: () {
            setState(() {
              _selectedIndex = isSelected ? null : index;
            });
            widget.onCategorySelected(item.category);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? primaryButtonColor : surfaceColor,
              borderRadius: BorderRadius.circular(circular12),
              border: isSelected
                  ? BoxBorder.all(
                      style: BorderStyle.solid,
                      color: backgroundRed,
                    )
                  : BoxBorder.all(style: BorderStyle.none),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.icon ?? '❔', style: TextStyle(fontSize: textSize18)),
                Text(
                  item.category,
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
