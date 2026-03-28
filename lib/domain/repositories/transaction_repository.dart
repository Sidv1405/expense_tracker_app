import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getTransactions();

  Stream<List<TransactionEntity>> watchTransactions();

  Future<void> addTransaction(TransactionEntity transaction);
}
