part of 'most_traded_bloc.dart';

sealed class MostTradedEvent extends Equatable {
  const MostTradedEvent();

  @override
  List<Object> get props => [];
}

final class LoadMostTradedItems extends MostTradedEvent {}
