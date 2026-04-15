class AddIncomeEvent {
  const AddIncomeEvent();
}

class SaveIncomeEvent extends AddIncomeEvent {
  const SaveIncomeEvent();
}

class UploadIncomeCategoriesEvent extends AddIncomeEvent {
  const UploadIncomeCategoriesEvent();
}
