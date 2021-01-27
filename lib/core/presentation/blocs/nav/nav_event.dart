part of 'nav_bloc.dart';

abstract class NavEvent {
  Stream<NavState> applyAsync({
    NavState currentState,
    NavBloc bloc,
  });
}

class UpdateNavEvent extends NavEvent {
  final ScreenEnum screenEnum;

  UpdateNavEvent(this.screenEnum);

  @override
  Stream<NavState> applyAsync({NavState currentState, NavBloc bloc}) async* {
    yield NavState(_screen(screenEnum));
  }

  Screen _screen(ScreenEnum screenEnum) {
    switch (screenEnum) {
      case ScreenEnum.favourite:
        return favourite;
      case ScreenEnum.bag:
        return bag;
      case ScreenEnum.account:
        return account;
      default:
        return home;
    }
  }
}
