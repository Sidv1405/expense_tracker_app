import '../data/data_source/database/app_database.dart';
import 'di.dart';

Future<void> seedDefaultCategories() async {
  final AppDatabase db = instance<AppDatabase>();
  final List<Category> categories = await db.select(db.categories).get();

  if (categories.isEmpty) {
    await db
        .into(db.categories)
        .insert(
          CategoriesCompanion.insert(
            name: 'Food',
            icon: 'fastfood',
            type: 'expense',
          ),
        );
    await db
        .into(db.categories)
        .insert(
          CategoriesCompanion.insert(
            name: 'Salary',
            icon: 'payments',
            type: 'income',
          ),
        );
  }
}
