import 'package:finance_tracker/features/add_entry/domain/entities/expense_category_entity.dart';

class GetIncomeSourcesUseCase {
  List<CategoryEntity> getIncomeSources() {
    return [
      CategoryEntity(title: 'Зарплата', icon: '💸'),
      CategoryEntity(title: 'Родители', icon: '👨‍👩‍👧‍👦'),
      CategoryEntity(title: 'Друзья', icon: '👯‍♂️'),
      CategoryEntity(title: 'Долг', icon: '📉'),
      CategoryEntity(title: 'Фриланс', icon: '👨‍💻'),
      CategoryEntity(title: 'Подарок', icon: '🎁'),
      CategoryEntity(title: 'Другое', icon: '🌀'),
    ];
  }
}
