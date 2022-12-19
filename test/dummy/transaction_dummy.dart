import 'package:moneymanager/domain/core/entities/entities.dart';
import 'package:moneymanager/infrastucture/core/drift/app_database.dart';

import 'account_dummy.dart';
import 'category_dummy.dart';

final dummyTTransaction = TTransaction(
  id: 1,
  categoryId: 1,
  type: TransactionType.expense,
  from: 1,
  amount: 2000,
  date: DateTime(2022, 2, 2),
  createdAt: DateTime(2022, 2, 2),
  updatedAt: DateTime(2022, 2, 2),
);

final dummyTTransactionData = TTransactionData(
  transaction: dummyTTransaction,
  category: dummyTCategoryData,
  from: dummyTAccountData,
);

final dummyTransaction = dummyTTransactionData.toEntity();
