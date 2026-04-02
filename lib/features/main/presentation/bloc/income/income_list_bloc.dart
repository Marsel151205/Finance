import 'package:finance_tracker/features/main/domain/use_cases/get_income_list_use_case.dart';
import 'package:finance_tracker/features/main/presentation/bloc/income/income_list_event.dart';
import 'package:finance_tracker/features/main/presentation/bloc/income/income_list_state.dart';
import 'package:finance_tracker/shared/presentation/models/income_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeListBloc extends Bloc<IncomeListEvent, IncomeListState> {
  final GetIncomeListUseCase _getIncomeListUseCase;

  IncomeListBloc(this._getIncomeListUseCase) : super(LoadingIncomeListState()) {
    on<GetIncomeListEvent>((event, emit) => _getIncomeList(event, emit));
    add(GetIncomeListEvent());
  }

  Future<void> _getIncomeList(
    GetIncomeListEvent event,
    Emitter<IncomeListState> emit,
  ) async {
    emit(LoadingIncomeListState());
    final result = await _getIncomeListUseCase.getIncomeList();
    result.fold(
      (failure) {
        emit(ErrorIncomeListState(failure));
      },
      (success) {
        emit(
          SuccessIncomeListState(success.map((e) => e.toModelUi()).toList()),
        );
      },
    );
  }
}