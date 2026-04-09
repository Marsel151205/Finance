import 'package:finance_tracker/features/main/domain/repositories/income_list_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetTotalIncomeUseCase {
  final IncomeListRepository _incomeListRepository;

  const GetTotalIncomeUseCase(this._incomeListRepository);

  Future<Either<String, int>> call() async {
    final result = await _incomeListRepository.getIncomeList();
    return result.fold((failure) => Left(failure), (success) {
      return Right(success.fold(0, (sum, incomes) => sum + incomes.sum));
    });
  }
}
