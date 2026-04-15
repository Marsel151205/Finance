class CreateBalanceEvent {
  const CreateBalanceEvent();
}

class CreateNewBalanceEvent extends CreateBalanceEvent {
  final int? sum;

  const CreateNewBalanceEvent(this.sum);
}
