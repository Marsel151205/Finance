import 'package:finance_tracker/shared/domain/entities/expense_entity.dart';

import '../../../app/database/database.dart';

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
