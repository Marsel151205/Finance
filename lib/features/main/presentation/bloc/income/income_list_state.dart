import '../../../../../shared/presentation/models/income_model.dart';

class IncomeListState {
  const IncomeListState();
}

class SuccessIncomeListState extends IncomeListState {
  final List<IncomeModelUi> incomeList;

  const SuccessIncomeListState(this.incomeList);
}

class LoadingIncomeListState extends IncomeListState {
  const LoadingIncomeListState();
}

class ErrorIncomeListState extends IncomeListState {
  final String errorMessage;

  const ErrorIncomeListState(this.errorMessage);
}
