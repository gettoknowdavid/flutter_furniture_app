import 'package:flutter/material.dart';
import 'features/cart/presentation/pages/cart_page.dart';

import 'core/utils/screen_enum.dart';
import 'features/furniture/presentation/pages/furniture_page.dart';

class Screen {
  final String title;
  final ScreenEnum screenEnum;
  final Widget child;

  Screen(this.title, this.screenEnum, this.child);
}

final Screen home = Screen('HOME', ScreenEnum.home, FurniturePage());
final Screen favourite = Screen('HOME', ScreenEnum.favourite, FavouritePage());
final Screen bag = Screen('BAG', ScreenEnum.bag, CartPage());
final Screen account = Screen('ACCOUNT', ScreenEnum.account, AccountPage());


class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}



class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}