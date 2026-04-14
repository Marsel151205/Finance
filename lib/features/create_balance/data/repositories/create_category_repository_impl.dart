import 'package:drift/drift.dart';
import 'package:finance_tracker/app/database/database.dart';
import 'package:finance_tracker/features/create_balance/domain/repositories/create_category_repository.dart';
import 'package:finance_tracker/shared/category/data/models/category_mapper.dart';
import 'package:finance_tracker/shared/category/domain/entities/expense_category_entity.dart';
import 'package:fpdart/fpdart.dart';

class CreateCategoryRepositoryImpl extends CreateCategoryRepository {
  final AppDatabase _appDatabase;

  CreateCategoryRepositoryImpl(this._appDatabase);

  @override
  Future<Either<String, Unit>> createCategory(
    List<CategoryEntity> categories,
  ) async {
    try {
      final categoriesList = categories
          .map((category) => category.toData())
          .toList();
      await _appDatabase.batch((batch) {
        batch.insertAll(
          _appDatabase.categoryItem,
          categoriesList
              .map(
                (category) => CategoryItemCompanion.insert(
                  category: Value(category.category),
                  icon: Value(category.icon),
                  color: category.color,
                  isExpense: Value(category.isExpense),
                ),
              )
              .toList(),
        );
      });
      return Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
