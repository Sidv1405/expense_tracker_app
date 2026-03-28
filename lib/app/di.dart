import 'package:get_it/get_it.dart';

import '../data/data_source/database/app_database.dart';
import '../data/data_source/local_data_source.dart';
import '../data/repositories/transaction_repository_impl.dart';
import '../domain/repositories/transaction_repository.dart';
import '../domain/use_cases/transaction/add_transaction_usecase.dart';
import '../domain/use_cases/transaction/get_transactions_usecase.dart';

final GetIt instance = GetIt.instance;

Future<void> initAppModule() async {
  // 1. Database (Singleton)
  final AppDatabase db = AppDatabase();
  instance.registerLazySingleton<AppDatabase>(() => db);

  // 2. Data Sources
  instance.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(instance<AppDatabase>()),
  );

  // 3. Repositories
  instance.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(instance<LocalDataSource>()),
  );

  // 4. UseCases
  instance.registerLazySingleton<GetTransactionsUseCase>(
    () => GetTransactionsUseCase(instance<TransactionRepository>()),
  );
  instance.registerLazySingleton<AddTransactionUseCase>(
    () => AddTransactionUseCase(instance<TransactionRepository>()),
  );
}
