import 'package:uuid/uuid.dart';

enum CategoryEnum { food, travel, leisure, work, health, other }

const categoryIcons = {
  CategoryEnum.food: '🍔',
  CategoryEnum.travel: '✈️',
  CategoryEnum.leisure: '🎮',
  CategoryEnum.work: '💼',
  CategoryEnum.health: '💊',
  CategoryEnum.other: '🛒',
};

class Expense {
  Expense({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
  }) : id = const Uuid().v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final CategoryEnum category;
}
