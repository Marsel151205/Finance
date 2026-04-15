import 'package:finance_tracker/app/database/database.dart';

import '../../domain/entities/expense_category_entity.dart';

extension CategoryDataMapper on CategoryEntity {
  CategoryItemData toData() {
    return CategoryItemData(
      id: 0,
      category: title,
      icon: icon,
      color: color,
      isExpense: isExpense,
    );
  }
}

extension CategoryEntityMapper on CategoryItemData {
  CategoryEntity toEntity() {
    return CategoryEntity(
      title: category!,
      icon: icon,
      color: color,
      isExpense: isExpense,
    );
  }
}
