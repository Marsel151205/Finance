import 'package:finance_tracker/features/main/domain/repositories/income_list_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../shared/domain/entities/income_entity.dart';

class GetIncomeListUseCase {
  const GetIncomeListUseCase(this._incomeListRepository);

  final IncomeListRepository _incomeListRepository;

  Future<Either<String, List<IncomeEntity>>> getIncomeList() =>
      _incomeListRepository.getIncomeList();
}
