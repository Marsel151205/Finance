class IncomeEntity {
  final int? id;
  final int sum;
  final String category;
  final String incomeSource;
  final String comment;

  const IncomeEntity({
    this.id,
    required this.sum,
    required this.category,
    required this.incomeSource,
    required this.comment,
  });
}
