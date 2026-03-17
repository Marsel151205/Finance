import 'package:finance_tracker/features/add_entry/domain/entities/expense/expense_entity.dart';

class ExpenseModelUi {
  final int? id;
  final int sum;
  final String? category;
  final bool isUnnecessary;
  final String? comment;

  ExpenseModelUi({
    this.id,
    required this.sum,
    this.category,
    this.isUnnecessary = false,
    this.comment = '',
  });
}

extension ExpenseModelUiMapper on ExpenseModelUi {
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
