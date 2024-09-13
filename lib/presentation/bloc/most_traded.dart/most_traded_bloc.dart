import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/data/models/top_gainers.dart';
import 'package:stock_watchlist/domain/usecase/most_actively_traded_use_case.dart';

part 'most_traded_event.dart';
part 'most_traded_state.dart';

class MostTradedBloc extends Bloc<MostTradedEvent, MostTradedState> {
  GetMostActivelyTrades getMostActivelyTrades;
  MostTradedBloc(this.getMostActivelyTrades) : super(MostTradedInitial()) {
    on<MostTradedEvent>((event, emit) {});

    on<LoadMostTradedItems>((event, emit) async {
      try {
        TopGainers topGainers = await getMostActivelyTrades.call();
        emit(MostTradedLoaded(topGainers));
      } catch (e) {
        emit(MostTradedError(e.toString()));
      }
    });
  }
}
