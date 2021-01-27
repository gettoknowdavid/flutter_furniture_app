import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/presentation/widgets/gradient_container.dart';
import '../../../../core/presentation/widgets/lamda_app_bar.dart';
import '../../../../core/presentation/widgets/lamda_back_button.dart';
import '../../../../core/utils/total_and_add_to_cart_widget.dart';
import '../../domain/entity/furniture.dart';
import '../widgets/color_selector.dart';

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({Key key, @required this.furniture}) : super(key: key);

  final Furniture furniture;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final imageHeight = height * 0.43;

    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(60),
        ),
        child: Container(
          color: Color(0xFFF9F9F9),
          height: imageHeight,
          width: width,
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(furniture.imageUrl),
        ),
      ),
    );
  }
}

class _TitleAndPrice extends StatelessWidget {
  const _TitleAndPrice({Key key, @required this.furniture}) : super(key: key);

  final Furniture furniture;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final width = MediaQuery.of(context).size.width;

    final priceContainerHeight = width * 0.12;
    final priceContainerWidth = width * 0.22;

    final NumberFormat formatter = NumberFormat.simpleCurrency(
      decimalDigits: 2,
      locale: Localizations.localeOf(context).toString(),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        children: [
          Expanded(
            child: Hero(
              tag: '__${furniture.name}__',
              child: Text(
                furniture.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
          SizedBox(width: 30),
          GradientContainer(
            height: priceContainerHeight,
            width: priceContainerWidth,
            borderRadius: 14,
            alignment: Alignment.center,
            child: Hero(
              tag: '_${furniture.id}_${furniture.price}',
              child: Text(
                formatter.format(furniture.price),
                style: textTheme.headline6.copyWith(
                  color: colorScheme.secondary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({Key key, @required this.furniture}) : super(key: key);

  final Furniture furniture;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Description',
                style: textTheme.headline6.copyWith(
                  fontSize: 17,
                ),
              ),
              Spacer(),
              Icon(
                Icons.star,
                color: colorScheme.secondary,
              ),
              Text(
                furniture.rating.toString() ?? '0',
                style: textTheme.headline6.copyWith(
                  fontSize: 17,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            furniture.description,
            style: textTheme.bodyText1.copyWith(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Designer: ${furniture.designer}',
            style: textTheme.headline6.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key key, @required this.furniture}) : super(key: key);

  final Furniture furniture;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: LamdaAppBar(
        title: 'Product',
        leading: LamdaBackButton(),
        backgroundColor: Color(0xFFF9F9F9),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: '__${widget.furniture.imageUrl}__',
                child: _ImageWidget(furniture: widget.furniture),
              ),
              ColorSelector(
                furniture: widget.furniture,
                selectedIndex: _colorIndex,
                onSelected: (index) {
                  setState(() => _colorIndex = index);
                },
              ),
              _TitleAndPrice(furniture: widget.furniture),
              SizedBox(height: 26),
              _Description(furniture: widget.furniture),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: TotalAndAddToCartWidget(),
    );
  }
}
