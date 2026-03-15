import 'package:finance_tracker/app/database/database.dart';
import 'package:finance_tracker/features/add_entry/data/repositories/expense_repository_impl.dart';
import 'package:finance_tracker/features/add_entry/domain/use_cases/add_expense_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../features/add_entry/domain/repositories/add_expense_repository.dart';
import '../../features/add_entry/presentation/bloc/expense/expense_bloc.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  // Database
  serviceLocator.registerSingleton<AppDatabase>(AppDatabase());

  // Expense
  serviceLocator.registerLazySingleton<ExpenseRepository>(
    () => ExpenseRepositoryImpl(serviceLocator<AppDatabase>()),
  );
  serviceLocator.registerLazySingleton<AddExpenseUseCase>(
    () => AddExpenseUseCase(serviceLocator<ExpenseRepository>()),
  );
  serviceLocator.registerFactory<ExpenseBloc>(
    () => ExpenseBloc(serviceLocator()),
  );
}
