import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  // 'income', 'expense', 'transfer'

  const TransactionEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.categoryId,
    required this.accountId,
    this.note,
    required this.type,
  });

  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final int categoryId;
  final int accountId;
  final String? note;
  final String type;

  @override
  List<Object?> get props => <Object?>[
    id,
    title,
    amount,
    date,
    categoryId,
    accountId,
    note,
    type,
  ];
}
