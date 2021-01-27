import 'package:flutter/material.dart';
import '../../utils/lamda_images.dart';
import '../../../features/cart/presentation/pages/cart_page.dart';

class LamdaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LamdaAppBar({
    Key key,
    this.title,
    this.leading,
    this.showLeading = true,
    this.backgroundColor,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  final Widget leading;
  final bool showLeading;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(horizontal: 26);

    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(title ?? 'flutter_furniture_app'),
      leadingWidth: showLeading ? 80 : 26,
      leading: showLeading
          ? leading ??
              IconButton(
                icon: ImageIcon(menuPng),
                iconSize: 28,
                splashRadius: 26,
                padding: padding,
                onPressed: () {},
              )
          : Container(),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_bag_outlined),
          iconSize: 30,
          splashRadius: 26,
          padding: padding,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(
                  showAppBarLeading: true,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  final Size preferredSize;
}
