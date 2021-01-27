import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';

import 'core/presentation/blocs/nav/nav_bloc.dart';
import 'dependency_injector.dart' as di;
import 'dependency_injector.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/furniture/presentation/bloc/furniture_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.initialize();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<FurnitureBloc>(
          create: (context) => sl<FurnitureBloc>()..add(GetAllFurnitureEvent()),
        ),
        BlocProvider<NavBloc>(
          create: (context) => sl<NavBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => sl<CartBloc>()..add(GetFurnituresInCartEvent()),
        ),
      ],
      child: App(),
    ),
  );
}
