import '../../../core/use_case/base_use_case.dart';
import '../../entities/transaction_entity.dart';
import '../../repositories/transaction_repository.dart';

class GetTransactionsUseCase
    extends StreamUseCase<NoParameters, List<TransactionEntity>> {
  GetTransactionsUseCase(this._repository);

  final TransactionRepository _repository;

  @override
  Stream<List<TransactionEntity>> execute(NoParameters input) {
    return _repository.watchTransactions();
  }
}
