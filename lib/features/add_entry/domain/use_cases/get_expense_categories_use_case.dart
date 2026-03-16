import '../entities/expense_category_entity.dart';

class GetExpenseCategoriesUseCase {
  List<ExpenseCategoryEntity> getExpenseCategories() {
    List<ExpenseCategoryEntity> expenseList = [
      ExpenseCategoryEntity(title: 'Еда'),
      ExpenseCategoryEntity(title: 'Транспорт'),
      ExpenseCategoryEntity(title: 'Развелечение'),
      ExpenseCategoryEntity(title: 'Жилье'),
      ExpenseCategoryEntity(title: 'Здоровье'),
      ExpenseCategoryEntity(title: 'Одежда'),
      ExpenseCategoryEntity(title: 'Подписки'),
      ExpenseCategoryEntity(title: 'Другое'),
    ];

    return expenseList;
  }
}
