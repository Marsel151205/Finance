import 'package:finance_tracker/app/database/database.dart';
import 'package:finance_tracker/shared/balance/domain/entities/balance_entity.dart';

extension BalanceDataMapper on BalanceItemData {
  BalanceEntity toEntity() {
    return BalanceEntity(id: id, sum: balance, updateAt: updateAt);
  }
}
