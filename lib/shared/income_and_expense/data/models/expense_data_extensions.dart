import '../../../../app/database/database.dart';
import '../../domain/entities/expense_entity.dart';

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
