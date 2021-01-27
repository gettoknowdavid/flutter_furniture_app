import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/widgets/lamda_app_bar.dart';
import '../bloc/furniture_bloc.dart';
import '../widgets/assymetric_view.dart';
import '../widgets/search_and_filter.dart';

class FurniturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: LamdaAppBar(),
      body: BlocBuilder<FurnitureBloc, FurnitureState>(
        builder: (context, state) {
          if (state is FurnitureLoaded) {
            return Column(
              children: [
                SearchAndFilter(),
                Expanded(
                  child: AssymetricView(
                    furnitures: state.furnitures,
                  ),
                ),
              ],
            );
          } else if (state is FurnitureError) {
            return Center(
              child: Text(
                state.message,
                style: textTheme.headline5,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
