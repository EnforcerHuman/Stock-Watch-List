part of 'most_traded_bloc.dart';

sealed class MostTradedState extends Equatable {
  const MostTradedState();

  @override
  List<Object> get props => [];
}

final class MostTradedInitial extends MostTradedState {}

final class MostTradedLoaded extends MostTradedState {
  final TopGainers topGainers;

  const MostTradedLoaded(this.topGainers);
}

final class MostTradedError extends MostTradedState {
  final String error;

  const MostTradedError(this.error);
}
