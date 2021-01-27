import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/presentation/widgets/lamda_bottom_nav_bar.dart';

import 'core/presentation/blocs/nav/nav_bloc.dart';
import 'core/utils/lamda_images.dart';
import 'core/utils/screen_enum.dart';

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = context.read<NavBloc>();
    final theme = Theme.of(context);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: BlocBuilder<NavBloc, NavState>(
        cubit: bloc,
        builder: (context, state) {
          final _index = state.screen.screenEnum.index;
          final _screens = ScreenEnum.values;

          return Scaffold(
            body: state.screen.child,
            bottomNavigationBar: LamdaBottomNavBar(
              index: _index,
              items: _items(theme),
              onSelected: (i) {
                bloc..add(UpdateNavEvent(_screens[i]));
              },
            ),
          );
        },
      ),
    );
  }

  Widget _icons(ScreenEnum screenEnum) {
    switch (screenEnum) {
      case ScreenEnum.bag:
        return Icon(Icons.shopping_bag, size: 24);
        break;
      case ScreenEnum.account:
        return Icon(Icons.person, size: 24);
        break;
      case ScreenEnum.favourite:
        return Icon(Icons.favorite, size: 24);
        break;
      default:
        return ImageIcon(homePng, size: 20);
    }
  }

  List<LamdaBottomNavBarItem> _items(theme) {
    List<LamdaBottomNavBarItem> _items = [];

    for (ScreenEnum screenEnum in ScreenEnum.values) {
      _items.add(
        LamdaBottomNavBarItem(
          icon: _icons(screenEnum),
          activeColor: theme.colorScheme.onSecondary,
          inActiveColor: Colors.white24,
        ),
      );
    }

    return _items;
  }
}
