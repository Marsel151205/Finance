import 'package:finance_tracker/shared/balance/presentation/models/balance_model_ui.dart';

class OverviewState {
  const OverviewState();
}

class LoadingOverviewState extends OverviewState {
  const LoadingOverviewState();
}

class ErrorOverviewState extends OverviewState {
  final String errorMessage;

  const ErrorOverviewState(this.errorMessage);
}

class SuccessOverviewState extends OverviewState {
  final BalanceModelUi model;
  final int totalExpense;
  final int totalIncome;

  const SuccessOverviewState(this.model, this.totalExpense, this.totalIncome);
}
