import 'package:finance_tracker/shared/balance/domain/entities/balance_entity.dart';

class BalanceModelUi {
  final int sum;

  const BalanceModelUi(this.sum);
}

extension BalanceEntityMapper on BalanceEntity {
  BalanceModelUi toModelUi() {
    return BalanceModelUi(sum);
  }
}
