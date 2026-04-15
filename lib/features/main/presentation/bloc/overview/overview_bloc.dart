import 'package:finance_tracker/features/main/domain/use_cases/get_total_income_use_case.dart';
import 'package:finance_tracker/features/main/presentation/bloc/overview/overview_event.dart';
import 'package:finance_tracker/features/main/presentation/bloc/overview/overview_state.dart';
import 'package:finance_tracker/shared/balance/presentation/models/balance_model_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/balance/domain/use_cases/get_balance_use_case.dart';
import '../../../domain/use_cases/get_total_expense_use_case.dart';

class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  final GetBalanceUseCase _getBalanceUseCase;
  final GetTotalExpenseUseCase _getTotalExpenseUseCase;
  final GetTotalIncomeUseCase _getTotalIncomeUseCase;

  OverviewBloc(
    this._getBalanceUseCase,
    this._getTotalExpenseUseCase,
    this._getTotalIncomeUseCase,
  ) : super(LoadingOverviewState()) {
    on<UploadDataOverviewEvent>((event, emit) async {
      await _uploadData(event, emit);
    });
    add(UploadDataOverviewEvent());
  }

  Future<void> _uploadData(
    UploadDataOverviewEvent event,
    Emitter<OverviewState> emit,
  ) async {
    emit(LoadingOverviewState());
    final result = await _getBalanceUseCase.getBalance();
    final totalExpenseResult = await _getTotalExpenseUseCase();
    final totalIncomeResult = await _getTotalIncomeUseCase();
    result.fold((failure) => emit(ErrorOverviewState(failure)), (balance) {
      totalExpenseResult.fold((failure) => emit(ErrorOverviewState(failure)), (
        totalExpense,
      ) {
        totalIncomeResult.fold((failure) => emit(ErrorOverviewState(failure)), (
          totalIncome,
        ) {
          emit(
            SuccessOverviewState(
              balance.toModelUi(),
              totalExpense,
              totalIncome,
            ),
          );
        });
      });
    });
  }
}
