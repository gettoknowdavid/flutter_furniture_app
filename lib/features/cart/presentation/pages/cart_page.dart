import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/widgets/lamda_app_bar.dart';
import '../../../../core/presentation/widgets/lamda_back_button.dart';
import '../../../../core/utils/total_and_add_to_cart_widget.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/cart_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key, this.showAppBarLeading = false}) : super(key: key);

  final bool showAppBarLeading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: LamdaAppBar(
        title: 'Cart',
        showLeading: showAppBarLeading,
        leading: LamdaBackButton(),
        // backgroundColor: Color(0xFFF0F0F0),
      ),
      // backgroundColor: Color(0xFFF0F0F0),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartEmpty) {
            return Center(
              child: Text(
                'Cart is empty',
                style: textTheme.headline5,
              ),
            );
          } else if (state is CartLoaded) {
            return CartList(
              furnitureMap: state.furnitureMap,
              furnitures: state.furnitures,
            );
          } else if (state is CartError) {
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
      bottomNavigationBar: TotalAndAddToCartWidget(
      ),
    );
    
  }
}
