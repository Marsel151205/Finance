import '../entities/expense_category_entity.dart';

class GetExpenseCategoriesUseCase {
  List<CategoryEntity> getExpenseCategories() {
    List<CategoryEntity> expenseList = [
      CategoryEntity(title: 'Еда', icon: '🍕'),
      CategoryEntity(title: 'Транспорт', icon: '🚗'),
      CategoryEntity(title: 'Развелечение', icon: '🎮'),
      CategoryEntity(title: 'Жилье', icon: '🏠'),
      CategoryEntity(title: 'Здоровье', icon: '💊'),
      CategoryEntity(title: 'Одежда', icon: '👕'),
      CategoryEntity(title: 'Подписки', icon: '💳'),
      CategoryEntity(title: 'Другое', icon: '📦'),
    ];

    return expenseList;
  }
}
