part of 'nav_bloc.dart';

class NavState extends Equatable {
  NavState(this.screen, [this.params]);

  final Screen screen;

  final List params;

  @override
  List<Object> get props => (params ?? [screen]);
}
