import 'package:get_it/get_it.dart';
import 'core/presentation/blocs/nav/nav_bloc.dart';
import 'features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'features/cart/domain/usecases/get_furnitures_in_cart_usecase.dart';
import 'features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/furniture/data/repository/furniture_repository_implementation.dart';
import 'features/cart/data/datasources/cart_local_data_source.dart';
import 'features/cart/data/datasources/cart_local_data_source_implementation.dart';
import 'features/cart/data/repository/cart_repository_implementation.dart';
import 'features/cart/domain/repository/cart_repository.dart';
import 'features/furniture/data/datasources/furniture_local_data_source.dart';
import 'features/furniture/data/datasources/furniture_local_data_source_implementation.dart';
import 'features/furniture/domain/repository/furniture_repository.dart';
import 'features/furniture/domain/usecase/get_all_furniture_usecase.dart';
import 'features/furniture/presentation/bloc/furniture_bloc.dart';
import 'package:sembast/sembast.dart';

import 'core/database/lamda_database.dart';

final sl = GetIt.instance;
final StoreRef _furnitureStore = intMapStoreFactory.store('__furniture__');
final StoreRef _cartStore = intMapStoreFactory.store('__cart_furniture__');

Future<void> initialize() async {
  // Local Data sources
  sl.registerLazySingleton<FurnitureLocalDataSource>(
    () => FurnitureLocalDataSourceImplementation(
        database: sl(), store: _furnitureStore),
  );

  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImplementation(
      database: sl(),
      furnitureStore: _furnitureStore,
      cartStore: _cartStore,
    ),
  );

  // Repository
  sl.registerLazySingleton<FurnitureRepository>(
    () => FurnitureRepositoryImplementation(localDataSource: sl()),
  );

  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImplementation(localDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton<GetAllFunitureUseCase>(
    () => GetAllFunitureUseCase(repository: sl()),
  );

  sl.registerLazySingleton<GetFurnituresInCartUseCase>(
    () => GetFurnituresInCartUseCase(repository: sl()),
  );

  sl.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(repository: sl()),
  );

  sl.registerLazySingleton<RemoveFromCartUseCase>(
    () => RemoveFromCartUseCase(repository: sl()),
  );

  // BLoCs
  sl.registerFactory<FurnitureBloc>(() => FurnitureBloc(useCase: sl()));

  sl.registerFactory<CartBloc>(
    () => CartBloc(
      getFurnituresInCartUseCase: sl(),
      addToCartUseCase: sl(),
      removeFromCartUseCase: sl(),
    ),
  );

  sl.registerFactory<NavBloc>(() => NavBloc());

  // Database
  final lamdaDb = await LamdaDatabase.init();
  sl.registerLazySingleton<LamdaDatabase>(() => lamdaDb);
}
