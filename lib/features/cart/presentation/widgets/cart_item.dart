import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/presentation/widgets/toggle_quantity_widget.dart';
import '../bloc/cart_bloc.dart';
import '../../../furniture/domain/entity/furniture.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key key,
    @required this.furniture,
    @required this.furnitureMap,
  }) : super(key: key);

  final Furniture furniture;
  final Map<int, int> furnitureMap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final mainContainerHeight = height * 0.12;

    final imageHeight = mainContainerHeight * 0.65;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final NumberFormat formatter = NumberFormat.simpleCurrency(
      decimalDigits: 2,
      locale: Localizations.localeOf(context).toString(),
    );

    // ignore: close_sinks
    final bloc = context.read<CartBloc>();

    final itemQuantity = furnitureMap[furniture.id];

    final _subtotal = itemQuantity * furniture.price;

    return Container(
      width: width,
      height: mainContainerHeight,
      padding: EdgeInsets.fromLTRB(12, 0, 18, 0),
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Radio(
            value: true,
            groupValue: true,
            onChanged: (v) {},
            toggleable: true,
            activeColor: colorScheme.secondaryVariant,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          SizedBox(width: 6),
          Material(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: imageHeight,
              width: imageHeight,
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(furniture.imageUrl),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: width * 0.32,
            padding: EdgeInsets.fromLTRB(0, 12, 0, 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  furniture.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headline6.copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  formatter.format(_subtotal ?? 0),
                  style: textTheme.headline6.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 6),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: imageHeight * 0.8),
              child: ToggleQuantityWidget(
                add: () => bloc..add(AddToCartEvent(id: furniture.id)),
                remove: () => bloc..add(RemoveFromCartEvent(id: furniture.id)),
                value: itemQuantity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
