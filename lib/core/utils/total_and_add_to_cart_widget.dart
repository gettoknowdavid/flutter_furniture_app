import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/cart/presentation/bloc/cart_bloc.dart';
import '../presentation/widgets/gradient_container.dart';
import '../presentation/widgets/toggle_quantity_widget.dart';

class TotalAndAddToCartWidget extends StatelessWidget {
  const TotalAndAddToCartWidget({
    Key key,
    this.toggleWidgetVisible = true,
  }) : super(key: key);

  final bool toggleWidgetVisible;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // ignore: close_sinks
    // final cartBloc = context.read<CartBloc>();

    // final NumberFormat formatter = NumberFormat.simpleCurrency(
    //   decimalDigits: 2,
    //   locale: Localizations.localeOf(context).toString(),
    // );

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(60),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 36),
              height: height * 0.2,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: (height * 0.2) * 0.5,
                    width: width,
                    child: Row(
                      children: [
                        toggleWidgetVisible
                            ? ToggleQuantityWidget(
                                add: () {},
                                remove: () {},
                                value: 0,
                              )
                            : Container(),
                        Spacer(),
                        Container(
                          child: Text(
                            'Total: ',
                            style: textTheme.headline6.copyWith(
                              fontSize: 18,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GradientContainer(
                    width: width,
                    height: (height * 0.2) * 0.35,
                    borderRadius: 20,
                    alignment: Alignment.center,
                    onPressed: () {},
                    child: Text(
                      'Add to cart',
                      style: textTheme.headline5.copyWith(
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
