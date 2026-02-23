import 'package:finance_tracker/features/add_entry/domain/use_cases/add_entry_use_case.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/add_entry_event..dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_entry_state.dart';

class AddEntryBloc extends Bloc<AddEntryEvent, AddEntryState> {
  final AddEntryUseCase _addEntryUseCase;

  AddEntryBloc(this._addEntryUseCase) : super(const AddEntryState()) {
    on<SaveIsExpenseEvent>((event, emit) {
      emit(state.copyWith(isExpenses: event.isExpense));
    });

    on<SaveCategoryEvent>((event, emit) {
      emit(state.copyWith(category: event.category));
    });

    on<SaveIsUnnecessaryEvent>((event, emit) {
      emit(state.copyWith(isUnnecessary: event.isUnnecessary));
    });

    on<SaveExpenseEvent>((event, emit) {
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
