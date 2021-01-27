import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/widgets/gradient_container.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../domain/entity/furniture.dart';
import '../pages/details_page.dart';

class FurnitureCard extends StatefulWidget {
  const FurnitureCard({Key key, @required this.furniture}) : super(key: key);

  final Furniture furniture;

  @override
  _FurnitureCardState createState() => _FurnitureCardState();
}

class _FurnitureCardState extends State<FurnitureCard> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final outerContainerHeight = height * 0.42;
    final outerContainerWidth = width * 0.42;

    final imageHeight = outerContainerHeight * 0.6;

    final buttonHeight = imageHeight * 0.135;

    return Container(
      // height: outerContainerHeight,
      width: outerContainerWidth,
      child: Stack(
        children: [
          Column(
            children: [
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailsPage(furniture: widget.furniture);
                  }));
                },
                elevation: 24,
                splashColor: Colors.transparent,
                fillColor: Colors.white,
                highlightColor: Colors.transparent,
                highlightElevation: 0,
                child: Container(
                  height: imageHeight,
                  width: imageHeight,
                  padding: const EdgeInsets.all(30.0),
                  child: Hero(
                    tag: '__${widget.furniture.imageUrl}__',
                    child: Image.asset(widget.furniture.imageUrl),
                  ),
                ),
              ),
              Stack(
                children: [
                  _CardDetails(furniture: widget.furniture),
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: GradientContainer(
                      height: buttonHeight,
                      width: buttonHeight,
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          context.read<CartBloc>()
                            ..add(
                              AddToCartEvent(id: widget.furniture.id),
                            );
                        },
                        padding: EdgeInsets.zero,
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CardDetails extends StatelessWidget {
  const _CardDetails({Key key, @required this.furniture}) : super(key: key);

  final Furniture furniture;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final NumberFormat formatter = NumberFormat.simpleCurrency(
      decimalDigits: 2,
      locale: Localizations.localeOf(context).toString(),
    );

    return Container(
      padding: EdgeInsets.fromLTRB(3, 12, 3, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: width * 0.12,
            alignment: Alignment.centerLeft,
            child: Hero(
              tag: '__${furniture.name}__',
              child: Text(
                furniture.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.headline5.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
          Text(
            furniture.designer.toUpperCase(),
            style: textTheme.subtitle2.copyWith(
              color: colorScheme.primary.withOpacity(0.3),
            ),
          ),
          SizedBox(height: 12),
          Hero(
            tag: '_${furniture.id}_${furniture.price}',
            child: Text(
              formatter.format(furniture.price),
              style: textTheme.headline5.copyWith(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: colorScheme.primary,
                letterSpacing: 0.3,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
