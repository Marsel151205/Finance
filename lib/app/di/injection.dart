import 'package:finance_tracker/app/database/database.dart';
import 'package:finance_tracker/features/add_entry/data/repositories/add_expense_repository_impl.dart';
import 'package:finance_tracker/features/add_entry/data/repositories/add_income_repository_impl.dart';
import 'package:finance_tracker/features/add_entry/domain/repositories/add_income_repository.dart';
import 'package:finance_tracker/features/add_entry/domain/use_cases/add_expense_use_case.dart';
import 'package:finance_tracker/features/add_entry/domain/use_cases/add_income_use_case.dart';
import 'package:finance_tracker/features/add_entry/domain/use_cases/get_expense_categories_use_case.dart';
import 'package:finance_tracker/features/add_entry/domain/use_cases/get_income_sources_use_case.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/income/add_income_bloc.dart';
import 'package:finance_tracker/features/create_balance/presentation/bloc/create_balance_bloc.dart';
import 'package:finance_tracker/features/main/data/repositories/expense_list_repository_impl.dart';
import 'package:finance_tracker/features/main/data/repositories/income_list_repository_impl.dart';
import 'package:finance_tracker/features/main/domain/repositories/expense_list_repository.dart';
import 'package:finance_tracker/features/main/domain/repositories/income_list_repository.dart';
import 'package:finance_tracker/features/main/domain/use_cases/get_expense_list_use_case.dart';
import 'package:finance_tracker/features/main/domain/use_cases/get_income_list_use_case.dart';
import 'package:finance_tracker/features/main/domain/use_cases/get_total_expense_use_case.dart';
import 'package:finance_tracker/features/main/domain/use_cases/get_total_income_use_case.dart';
import 'package:finance_tracker/features/main/presentation/bloc/expense/expense_list_bloc.dart';
import 'package:finance_tracker/features/main/presentation/bloc/income/income_list_bloc.dart';
import 'package:finance_tracker/features/main/presentation/bloc/overview/overview_bloc.dart';
import 'package:finance_tracker/shared/balance/data/repositories/balance_repository_impl.dart';
import 'package:finance_tracker/shared/balance/domain/repositories/balance_repository.dart';
import 'package:finance_tracker/shared/balance/domain/use_cases/add_balance_use_case.dart';
import 'package:finance_tracker/shared/balance/domain/use_cases/get_balance_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../features/add_entry/domain/repositories/add_expense_repository.dart';
import '../../features/add_entry/presentation/bloc/expense/add_expense_bloc.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  // Database
  serviceLocator.registerSingleton<AppDatabase>(AppDatabase());

  // Add Expense
  serviceLocator.registerLazySingleton<AddExpenseRepository>(
    () => AddExpenseRepositoryImpl(serviceLocator<AppDatabase>()),
  );
  serviceLocator.registerLazySingleton<AddExpenseUseCase>(
    () => AddExpenseUseCase(serviceLocator<AddExpenseRepository>()),
  );
  serviceLocator.registerLazySingleton<GetExpenseCategoriesUseCase>(
    () => GetExpenseCategoriesUseCase(),
  );
  serviceLocator.registerFactory<AddExpenseBloc>(
    () => AddExpenseBloc(serviceLocator(), serviceLocator()),
  );

  // Add Income
  serviceLocator.registerLazySingleton<AddIncomeRepository>(
    () => AddIncomeRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AddIncomeUseCase>(
    () => AddIncomeUseCase(serviceLocator<AddIncomeRepository>()),
  );
  serviceLocator.registerLazySingleton(() => GetIncomeSourcesUseCase());
  serviceLocator.registerFactory<AddIncomeBloc>(
    () => AddIncomeBloc(serviceLocator(), serviceLocator(), serviceLocator()),
  );

  // Expense List
  serviceLocator.registerLazySingleton<ExpenseListRepository>(
    () => ExpenseListRepositoryImpl(serviceLocator<AppDatabase>()),
  );
  serviceLocator.registerLazySingleton<GetExpenseListUseCase>(
    () => GetExpenseListUseCase(serviceLocator<ExpenseListRepository>()),
  );
  serviceLocator.registerLazySingleton<GetTotalExpenseUseCase>(
    () => GetTotalExpenseUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory<ExpenseListBloc>(
    () => ExpenseListBloc(serviceLocator<GetExpenseListUseCase>()),
  );

  // Income List
  serviceLocator.registerLazySingleton<IncomeListRepository>(
    () => IncomeListRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<GetIncomeListUseCase>(
    () => GetIncomeListUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<GetTotalIncomeUseCase>(
    () => GetTotalIncomeUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory<IncomeListBloc>(
    () => IncomeListBloc(serviceLocator()),
  );

  // Balance
  serviceLocator.registerLazySingleton<BalanceRepository>(
    () => BalanceRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<GetBalanceUseCase>(
    () => GetBalanceUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AddBalanceUseCase>(
    () => AddBalanceUseCase(serviceLocator()),
  );
  serviceLocator.registerFactory<CreateBalanceBloc>(
    () => CreateBalanceBloc(serviceLocator()),
  );

  // Overview
  serviceLocator.registerFactory<OverviewBloc>(
    () => OverviewBloc(serviceLocator(), serviceLocator(), serviceLocator()),
  );
}
