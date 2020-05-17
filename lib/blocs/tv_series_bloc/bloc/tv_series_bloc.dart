import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/repostories/api/tv_details_api.dart';
import 'package:tv_series/repostories/models/tv_details.dart';

import 'tv_series_event.dart';
import 'tv_series_state.dart';
import 'dart:convert';

class TvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  final TvDetailsAPI tv_api = TvDetailsAPI();
  @override
  TvSeriesState get initialState => TvSeriesInitial();

  @override
  Stream<TvSeriesState> mapEventToState(
    TvSeriesEvent event,
  ) async* {
    if (event is GetTvEvent) {
      yield LoadingTvSeriesState();
      try {
        var tv_response = await tv_api.getTvDetails(event.tvId);
        TvDetails response = TvDetails.fromJson(json.decode(tv_response));
        yield LoadedTvSeriesState(response);
      } catch (e) {
        yield ErrorTvSeriesState('$e');
      }
    }
  }
}
