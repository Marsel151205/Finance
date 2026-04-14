import 'package:finance_tracker/app/database/database.dart';
import 'package:finance_tracker/features/add_entry/domain/repositories/get_categories_repository.dart';
import 'package:finance_tracker/shared/category/data/models/category_mapper.dart';
import 'package:finance_tracker/shared/category/domain/entities/expense_category_entity.dart';
import 'package:fpdart/fpdart.dart';

class GetCategoriesRepositoryImpl extends GetCategoriesRepository {
  final AppDatabase _appDatabase;

  GetCategoriesRepositoryImpl(this._appDatabase);

  @override
  Future<Either<String, List<CategoryEntity>>> getCategories() async {
    try {
      final categories = await _appDatabase
          .select(_appDatabase.categoryItem)
          .get();

      return Right(categories.map((category) => category.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
