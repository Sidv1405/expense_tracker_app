import 'package:get_it/get_it.dart';

import '../data/data_source/database/app_database.dart';
import '../data/data_source/local_data_source.dart';

final GetIt instance = GetIt.instance;

Future<void> initAppModule() async {
  // 1. Database (Singleton)
  final AppDatabase db = AppDatabase();
  instance.registerLazySingleton<AppDatabase>(() => db);

  // 2. Data Sources
  instance.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(instance<AppDatabase>()),
  );

  // 3. Repositories (Sẽ thêm ở Giai đoạn 2)
  // instance.registerLazySingleton<TransactionRepository>(...);
}
