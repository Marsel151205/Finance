import 'package:fpdart/fpdart.dart';

import '../../../../shared/category/domain/entities/expense_category_entity.dart';

abstract class CreateCategoryRepository {
  Future<Either<String, Unit>> createCategory(List<CategoryEntity> categories);
}