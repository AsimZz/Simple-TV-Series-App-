import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/bloc.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/tv_search_bloc.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/tv_search_event.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/tv_search_state.dart';
import 'tv_series_page.dart';

class TvSearchPage extends SearchDelegate {
  final Bloc<TvSearchEvent, TvSearchState> tvBloc;
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);

    return theme.copyWith(
      primaryColor: Color(0xFF9E1F28),
      primaryIconTheme:
          theme.primaryIconTheme.copyWith(color: Color(0xFFFFFFFF)),
      primaryColorBrightness: Brightness.light,
      textTheme: theme.textTheme.copyWith(
        title: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
      ),
    );
  }

  final String searchFieldLabel = 'e.g Game of thrones';

  TvSearchPage(this.tvBloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    tvBloc.add(SearchTvEvent(query));
    return BlocBuilder<TvSearchBloc, TvSearchState>(
      bloc: tvBloc,
      builder: (context, state) {
        if (state is LoadingTvSearchState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ErrorTvSearchState) {
          return Container(
            child: Center(
              child: Text(state.message),
            ),
          );
        }
        if (state is LoadedSearchTvState) {
          final tv_shows = state.response;

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new TvSeriesPage(
                                tvId: tv_shows.results[index].id,
                              )));
                },
                leading: Icon(
                  Icons.tv,
                  color: Colors.black,
                ),
                title: Text(
                  tv_shows.results[index].originalName,
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
            itemCount: tv_shows.results.length,
          );
        }
      },
    );
  }
}
