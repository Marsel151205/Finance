import 'package:finance_tracker/features/add_entry/domain/repositories/get_categories_repository.dart';
import 'package:finance_tracker/shared/category/domain/entities/expense_category_entity.dart';
import 'package:fpdart/fpdart.dart';

class GetIncomeSourcesUseCase {
  final GetCategoriesRepository _getCategoriesRepository;

  const GetIncomeSourcesUseCase(this._getCategoriesRepository);

  Future<Either<String, List<CategoryEntity>>> getIncomeSources() async {
    final getCategoriesResult = await _getCategoriesRepository.getCategories();

    return getCategoriesResult.fold((failure) => Left(failure), (
      categoriesList,
    ) {
      return Right(
        categoriesList
            .where((category) => category.isExpense == false)
            .toList(),
      );
    });
  }
}
