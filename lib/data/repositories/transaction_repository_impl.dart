import 'package:drift/drift.dart';

import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../data_source/database/app_database.dart';
import '../data_source/local_data_source.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl(this._localDataSource);

  final LocalDataSource _localDataSource;

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    final List<Transaction> transactions = await _localDataSource
        .getAllTransactions();
    return transactions.map((Transaction t) => _mapToEntity(t)).toList();
  }

  @override
  Stream<List<TransactionEntity>> watchTransactions() {
    return _localDataSource.watchAllTransactions().map(
      (List<Transaction> list) =>
          list.map((Transaction t) => _mapToEntity(t)).toList(),
    );
  }

  @override
  Future<void> addTransaction(TransactionEntity entity) async {
    await _localDataSource.insertTransaction(
      TransactionsCompanion.insert(
        title: entity.title,
        amount: entity.amount,
        date: entity.date,
        categoryId: entity.categoryId,
        accountId: entity.accountId,
        type: entity.type,
        note: Value<String?>(entity.note),
      ),
    );
  }

  // Hàm helper để map dữ liệu
  TransactionEntity _mapToEntity(Transaction t) {
    return TransactionEntity(
      id: t.id,
      title: t.title,
      amount: t.amount,
      date: t.date,
      categoryId: t.categoryId,
      accountId: t.accountId,
      note: t.note,
      type: t.type,
    );
  }
}
