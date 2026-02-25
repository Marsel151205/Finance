import 'package:get_it/get_it.dart';

import '../../features/add_entry/domain/use_cases/add_entry_use_case.dart';
import '../../features/add_entry/presentation/bloc/add_entry_bloc.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  serviceLocator.registerFactory<AddEntryUseCase>(() => AddEntryUseCase());
  serviceLocator.registerFactory<AddEntryBloc>(() => AddEntryBloc(serviceLocator()));
}
