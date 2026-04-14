import 'dart:ui';

import 'package:finance_tracker/shared/category/domain/entities/expense_category_entity.dart';

class CategoryModelUi {
  final String category;
  final String icon;
  final int color;
  final bool isExpense;

  const CategoryModelUi({
    required this.category,
    required this.icon,
    required this.color,
    required this.isExpense,
  });
}

extension CategoryModelUiMapper on CategoryEntity {
  CategoryModelUi toModelUi() {
    return CategoryModelUi(
      category: title,
      icon: icon!,
      color: color,
      isExpense: isExpense,
    );
  }
}