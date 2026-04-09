class ExpenseEntity {
  final int? id;
  final int sum;
  final String? category;
  final bool isUnnecessary;
  final String? comment;

  ExpenseEntity({
    this.id,
    required this.sum,
    this.category,
    this.isUnnecessary = false,
    this.comment,
  });
}
