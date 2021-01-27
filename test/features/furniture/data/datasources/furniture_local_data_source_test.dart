import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_furniture_app/core/database/lamda_database.dart';
import 'package:flutter_furniture_app/core/errors/exceptions.dart';
import 'package:flutter_furniture_app/core/utils/lamda_furniture_model_list.dart';
import 'package:flutter_furniture_app/features/furniture/data/datasources/furniture_local_data_source_implementation.dart';
import 'package:mockito/mockito.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/src/api/finder.dart' as finder;
import 'package:matcher/matcher.dart' as matcher;

class MockDatabase extends Mock implements Future<Database> {
  final Database database = GetIt.I.get();
  final StoreRef store = intMapStoreFactory.store('__furniture__');
}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  LamdaDatabase.init();

  FurnitureLocalDataSourceImplementation dataSource;
  MockDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockDatabase();
    dataSource = FurnitureLocalDataSourceImplementation(
      database: mockDatabase.database,
      store: mockDatabase.store,
    );
  });

  int tKey = 0;

  test('should store the list of furniture in the database', () async {
    await dataSource.storeAllFurniture(allFurnitureModels);

    final expectedJsonString = json.encode(
      allFurnitureModels.map((e) => e.copyWith(id: tKey++).toJson()),
    );

    verify(mockDatabase.store.add(mockDatabase.database, expectedJsonString));
  });

  test(
    'should throw DbException when there is no data in the store',
    () async {
      when(mockDatabase.store.find(mockDatabase.database)).thenReturn(null);

      // ignore: await_only_futures
      final call = await dataSource.getAllFurniture;

      expect(() => call(), throwsA(isA<DbException>()));
    },
  );

  test(
    'should return list of FurnitureModels from SembastDatabase when there is one in the database',
    () async {
      final _finder = finder.Finder(sortOrders: [SortOrder('key', false)]);

      final snapshot = await mockDatabase.store.find(mockDatabase.database);

      when(await mockDatabase.store
              .find(mockDatabase.database, finder: _finder))
          .thenReturn(
        snapshot,
      );

      final result = await dataSource.getAllFurniture();

      verify(mockDatabase.store.find(mockDatabase.database, finder: any));

      expect(result, matcher.equals(allFurnitureModels));
    },
  );
}
