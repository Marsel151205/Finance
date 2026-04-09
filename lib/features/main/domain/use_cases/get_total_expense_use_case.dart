import 'package:finance_tracker/features/main/domain/repositories/expense_list_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetTotalExpenseUseCase {
  final ExpenseListRepository _expenseListRepository;

  const GetTotalExpenseUseCase(this._expenseListRepository);

  Future<Either<String, int>> call() async {
    final result = await _expenseListRepository.getAll();
    return result.fold((failure) => Left(failure), (success) {
      return Right(success.fold(0, (sum, model) => sum + model.sum));
    });
  }
}
