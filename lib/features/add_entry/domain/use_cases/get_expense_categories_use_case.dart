import 'package:finance_tracker/features/add_entry/domain/repositories/get_categories_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../shared/category/domain/entities/expense_category_entity.dart';

class GetExpenseCategoriesUseCase {
  final GetCategoriesRepository _getCategoriesRepository;

  const GetExpenseCategoriesUseCase(this._getCategoriesRepository);

  Future<Either<String, List<CategoryEntity>>> getExpenseCategories() async {
    final getCategoriesResult = await _getCategoriesRepository.getCategories();
    return getCategoriesResult.fold((failure) => Left(failure), (
      categoriesList,
    ) {
      return Right(
        categoriesList.where((category) => category.isExpense == true).toList(),
      );
    });
  }
}
