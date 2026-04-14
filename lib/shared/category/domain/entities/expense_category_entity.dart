class CategoryEntity {
  final String title;
  final String? icon;
  final int color;
  final bool isExpense;

  const CategoryEntity({
    required this.title,
    this.icon,
    required this.color,
    required this.isExpense
  });
}
