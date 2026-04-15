import 'package:finance_tracker/shared/category/domain/entities/expense_category_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class GetCategoriesRepository {
  Future<Either<String, List<CategoryEntity>>> getCategories();
}