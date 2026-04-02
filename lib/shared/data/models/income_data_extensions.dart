import 'package:finance_tracker/app/database/database.dart';
import 'package:finance_tracker/shared/domain/entities/income_entity.dart';

extension IncomeDataMapper on IncomeItemData {
  IncomeEntity toEntity() {
    return IncomeEntity(
      id: id,
      sum: sum,
      category: category!,
      incomeSource: incomeSource!,
      comment: comment!,
    );
  }
}
