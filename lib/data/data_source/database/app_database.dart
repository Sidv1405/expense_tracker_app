import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

// Định nghĩa bảng Categories (Hạng mục)
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  TextColumn get icon => text()(); // Lưu tên icon hoặc path
  TextColumn get type => text()(); // 'income' hoặc 'expense'
}

// Định nghĩa bảng Accounts (Tài khoản/Ví)
class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  RealColumn get balance => real().withDefault(const Constant<double>(0.0))();

  TextColumn get type => text()(); // 'Cash', 'Bank', 'Credit'
}

// Định nghĩa bảng Transactions (Giao dịch)
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 100)();

  RealColumn get amount => real()();

  DateTimeColumn get date => dateTime()();

  IntColumn get categoryId => integer().references(Categories, #id)();

  IntColumn get accountId => integer().references(Accounts, #id)();

  TextColumn get note => text().nullable()();

  TextColumn get imagePath => text().nullable()();

  TextColumn get type => text()(); // 'income', 'expense', 'transfer'
}

@DriftDatabase(tables: <Type>[Categories, Accounts, Transactions])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final Directory dbFolder = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dbFolder.path, 'expense_tracker.sqlite'));
    return NativeDatabase(file);
  });
}
