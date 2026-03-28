import 'database/app_database.dart';

abstract class LocalDataSource {
  // Transactions
  Future<List<Transaction>> getAllTransactions();

  Stream<List<Transaction>>
  watchAllTransactions(); // Theo dõi thay đổi real-time
  Future<Transaction?> getTransactionById(int id);

  Future<int> insertTransaction(TransactionsCompanion entry);

  Future<bool> updateTransaction(TransactionsCompanion entry);

  Future<int> deleteTransaction(int id);

  // Categories (Cần để hiển thị trong màn hình thêm giao dịch)
  Future<List<Category>> getAllCategories();

  Future<int> insertCategory(CategoriesCompanion entry);
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl(this._db);

  final AppDatabase _db;

  // --- Transactions Implementation ---

  @override
  Future<List<Transaction>> getAllTransactions() =>
      _db.select(_db.transactions).get();

  @override
  Stream<List<Transaction>> watchAllTransactions() =>
      _db.select(_db.transactions).watch();

  @override
  Future<Transaction?> getTransactionById(int id) {
    return (_db.select(
      _db.transactions,
    )..where(($TransactionsTable t) => t.id.equals(id))).getSingleOrNull();
  }

  @override
  Future<int> insertTransaction(TransactionsCompanion entry) =>
      _db.into(_db.transactions).insert(entry);

  @override
  Future<bool> updateTransaction(TransactionsCompanion entry) =>
      _db.update(_db.transactions).replace(entry);

  @override
  Future<int> deleteTransaction(int id) => (_db.delete(
    _db.transactions,
  )..where(($TransactionsTable t) => t.id.equals(id))).go();

  // --- Categories Implementation ---

  @override
  Future<List<Category>> getAllCategories() => _db.select(_db.categories).get();

  @override
  Future<int> insertCategory(CategoriesCompanion entry) =>
      _db.into(_db.categories).insert(entry);
}
