import 'package:finance_tracker/features/add_entry/domain/entities/expense_entity.dart';

import '../../../../app/database/database.dart';

extension ExpenseDataMapper on ExpenseItemData {
  ExpenseEntity toEntity() {
    return ExpenseEntity(
      id: id,
      sum: sum,
      category: category,
      isUnnecessary: isUnnecessary,
      comment: comment,
    );
  }
}
