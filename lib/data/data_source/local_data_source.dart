import 'database/app_database.dart';

abstract class LocalDataSource {
  // Định nghĩa các hàm sẽ dùng
  Future<List<Transaction>> getAllTransactions();

  Future<int> insertTransaction(TransactionsCompanion entry);
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl(this._db);

  final AppDatabase _db;

  @override
  Future<List<Transaction>> getAllTransactions() async {
    return await _db.select(_db.transactions).get();
  }

  @override
  Future<int> insertTransaction(TransactionsCompanion entry) async {
    return await _db.into(_db.transactions).insert(entry);
  }
}
