import '../../../core/use_case/base_use_case.dart';
import '../../entities/transaction_entity.dart';
import '../../repositories/transaction_repository.dart';

class AddTransactionUseCase extends BaseUseCase<TransactionEntity, void> {
  AddTransactionUseCase(this._repository);

  final TransactionRepository _repository;

  @override
  Future<void> execute(TransactionEntity input) {
    return _repository.addTransaction(input);
  }
}
