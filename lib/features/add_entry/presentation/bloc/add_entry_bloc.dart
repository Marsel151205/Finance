import 'package:finance_tracker/features/add_entry/domain/use_cases/add_entry_use_case.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/add_entry_event..dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_entry_state.dart';

class AddEntryBloc extends Bloc<AddEntryEvent, AddEntryState> {
  final AddEntryUseCase _addEntryUseCase;

  AddEntryBloc(this._addEntryUseCase) : super(const InitialState()) {
    on<SaveIsExpenseEvent>((event, emit) {
      emit(
        AddEntryState(
          isExpenses: event.isExpense,
          category: state.category,
          isUnnecessary: state.isUnnecessary,
        ),
      );
    });

    on<SaveCategoryEvent>((event, emit) {
      emit(
        AddEntryState(
          isExpenses: state.isExpenses,
          category: event.category,
          isUnnecessary: state.isUnnecessary,
        ),
      );
    });

    on<SaveIsUnnecessaryEvent>((event, emit) {
      emit(
        AddEntryState(
          isExpenses: state.isExpenses,
          category: state.category,
          isUnnecessary: event.isUnnecessary,
        ),
      );
    });

    on<SaveExpenseEvent>((event, emit) {
      emit(LoadingState());
      _addEntryUseCase.addEntryLocal(
        isExpense: state.isExpenses,
        sum: event.sum,
        category: state.category,
        isUnnecessary: state.isUnnecessary,
        comment: event.comment,
      );
    });
  }
}
