import '../entities/expense/expense_category_entity.dart';

class GetExpenseCategoriesUseCase {
  List<ExpenseCategoryEntity> getExpenseCategories() {
    List<ExpenseCategoryEntity> expenseList = [
      ExpenseCategoryEntity(title: 'Еда', icon: '🍕'),
      ExpenseCategoryEntity(title: 'Транспорт', icon: '🚗'),
      ExpenseCategoryEntity(title: 'Развелечение', icon: '🎮'),
      ExpenseCategoryEntity(title: 'Жилье', icon: '🏠'),
      ExpenseCategoryEntity(title: 'Здоровье', icon: '💊'),
      ExpenseCategoryEntity(title: 'Одежда', icon: '👕'),
      ExpenseCategoryEntity(title: 'Подписки', icon: '💳'),
      ExpenseCategoryEntity(title: 'Другое', icon: '📦'),
    ];

    return expenseList;
  }
}
