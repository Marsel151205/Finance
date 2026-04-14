import 'package:finance_tracker/features/create_balance/domain/repositories/create_category_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../shared/category/domain/entities/expense_category_entity.dart';

class CreateCategoriesUseCase {
  final CreateCategoryRepository _createCategoryRepository;

  const CreateCategoriesUseCase(this._createCategoryRepository);

  Future<Either<String, Unit>> call() async {
    final List<CategoryEntity> categoriesList = [
      CategoryEntity(
        title: 'Еда',
        icon: '🍕',
        color: 0xFFFFEDD5,
        isExpense: true,
      ),
      CategoryEntity(
        title: 'Транспорт',
        icon: '🚗',
        color: 0xFFDBEAFE,
        isExpense: true,
      ),
      CategoryEntity(
        title: 'Развелечение',
        icon: '🎮',
        color: 0xFFF3E8FF,
        isExpense: true,
      ),
      CategoryEntity(
        title: 'Жилье',
        icon: '🏠',
        color: 0xFFCCFBF1,
        isExpense: true,
      ),
      CategoryEntity(
        title: 'Здоровье',
        icon: '💊',
        color: 0xFFFEE2E2,
        isExpense: true,
      ),
      CategoryEntity(
        title: 'Одежда',
        icon: '👕',
        color: 0xFFFCE7F3,
        isExpense: true,
      ),
      CategoryEntity(
        title: 'Подписки',
        icon: '💳',
        color: 0xFFFEF3C7,
        isExpense: true,
      ),
      CategoryEntity(
        title: 'Другое',
        icon: '📦',
        color: 0xFFF1F5F9,
        isExpense: true,
      ),
      CategoryEntity(
        title: 'Зарплата',
        icon: '💸',
        color: 0xFFD1FAE5,
        isExpense: false,
      ),
      CategoryEntity(
        title: 'Родители',
        icon: '👨‍👩‍👧‍👦',
        color: 0xFFFFE4E6,
        isExpense: false,
      ),
      CategoryEntity(
        title: 'Друзья',
        icon: '👯‍♂️',
        color: 0xFFFEF3C7,
        isExpense: false,
      ),
      CategoryEntity(
        title: 'Долг',
        icon: '📉',
        color: 0xFFCCFBF1,
        isExpense: false,
      ),
      CategoryEntity(
        title: 'Фриланс',
        icon: '👨‍💻',
        color: 0xFFE0F2FE,
        isExpense: false,
      ),
      CategoryEntity(
        title: 'Подарок',
        icon: '🎁',
        color: 0xFFFAE8FF,
        isExpense: false,
      ),
      CategoryEntity(
        title: 'Другое',
        icon: '🌀',
        color: 0xFFF1F5F9,
        isExpense: false,
      ),
    ];

    return await _createCategoryRepository.createCategory(categoriesList);
  }
}
