import 'package:expense_tracker_app/models/expense.dart';

final List<Expense> registeredExpenses = [
  Expense(
    title: 'Flutter Course',
    amount: 19.99,
    date: DateTime.now(),
    category: CategoryEnum.work,
  ),
  Expense(
    title: 'Cinema',
    amount: 10.99,
    date: DateTime.now(),
    category: CategoryEnum.leisure,
  ),
];
