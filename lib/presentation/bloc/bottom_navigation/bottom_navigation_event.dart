part of 'bottom_navigation_bloc.dart';

@immutable
abstract class MainNavigationEvent {}

class NavigateToIndex extends MainNavigationEvent {
  final int index;
  NavigateToIndex(this.index);
}
