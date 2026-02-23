import 'package:get_it/get_it.dart';

import '../../features/add_entry/domain/use_cases/add_entry_use_case.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  serviceLocator.registerFactory<AddEntryUseCase>(() => AddEntryUseCase());
}
