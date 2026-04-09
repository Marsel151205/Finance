
import '../../domain/entities/income_entity.dart';

class IncomeModelUi {
  final int sum;
  final String category;
  final String incomeSource;
  final String comment;

  const IncomeModelUi({
    required this.sum,
    required this.category,
    required this.incomeSource,
    required this.comment,
  });
}

extension IncomeModelUiMapper on IncomeModelUi {
  IncomeEntity toEntity() {
    return IncomeEntity(
      sum: sum,
      category: category,
      incomeSource: incomeSource,
      comment: comment,
    );
  }
}

extension IncomeEntityMapper on IncomeEntity {
  IncomeModelUi toModelUi() {
    return IncomeModelUi(
      sum: sum,
      category: category,
      incomeSource: incomeSource,
      comment: comment,
    );
  }
}
