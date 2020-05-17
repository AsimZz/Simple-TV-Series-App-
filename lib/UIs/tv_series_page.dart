import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:tv_series/UIs/list_tv_series.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/bloc.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/tv_search_bloc.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/tv_search_event.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/tv_search_state.dart';
import 'package:tv_series/blocs/tv_series_bloc/bloc/tv_series_bloc.dart';
import 'package:tv_series/repostories/models/tv_details.dart';

import 'circular_clipper.dart';
import 'content_scroll.dart';
import 'tv_series_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:tv_series/blocs/tv_series_bloc/bloc/tv_series_bloc.dart';
import 'package:tv_series/blocs/tv_series_bloc/bloc/tv_series_event.dart';
import 'package:tv_series/blocs/tv_series_bloc/bloc/tv_series_state.dart';
import 'list_tv_series.dart';

class TvSeriesPage extends StatefulWidget {
  final int tvId;

  TvSeriesPage({Key key, this.tvId}) : super(key: key);
  @override
  _TvSeriesPageState createState() => _TvSeriesPageState();
}

class _TvSeriesPageState extends State<TvSeriesPage> {
  bool list_icon = true;
  bool favorites_icon = true;
  void myListButton() {
    setState(() {
      if (list_icon)
        list_icon = false;
      else
        list_icon = true;
    });
  }

  void myfavoritesButton() {
    setState(() {
      if (favorites_icon)
        favorites_icon = false;
      else
        favorites_icon = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider<TvSeriesBloc>(create: (context) {
          return TvSeriesBloc()..add(GetTvEvent(widget.tvId.toString()));
        }, child:
            BlocBuilder<TvSeriesBloc, TvSeriesState>(builder: (context, state) {
          if (state is LoadingTvSeriesState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ErrorTvSeriesState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is LoadedTvSeriesState) {
            return _getTvDetails(state.response, context);
          }
        })));
  }

  String _getGenreList(TvDetails show, context) {
    String genre = '';
    for (Genres i in show.genres) {
      genre = genre + i.name + ',';
    }
    return genre.substring(0, genre.length - 1);
  }

  Widget _getTvDetails(TvDetails show, context) {
    String genre = _getGenreList(show, context);
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(height: 100.0),
            Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: ClipShadowPath(
                clipper: CircularClipper(),
                shadow: Shadow(blurRadius: 20.0),
                child: FadeInImage.memoryNetwork(
                  height: 450.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image: 'https://image.tmdb.org/t/p/w500' + show.posterPath,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(left: 30.0),
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Colors.black,
                ),
              ],
            ),
            Positioned(
              bottom: 0.0,
              left: 20.0,
              child: IconButton(
                icon: (list_icon ? Icon(Icons.add) : Icon(Icons.remove)),
                onPressed: () {
                  if (list_icon) {
                    myList.add(ListTv(
                        id: show.id.toString(),
                        imageUrl: 'https://image.tmdb.org/t/p/w500' +
                            show.posterPath));
                  }
                  myListButton();
                },
                iconSize: 40.0,
                color: Colors.black,
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 25.0,
              child: IconButton(
                icon: (favorites_icon
                    ? Icon(Icons.favorite_border)
                    : Icon(Icons.favorite)),
                onPressed: () {
                  if (favorites_icon) {
                    favorites.add(ListTv(
                        id: show.id.toString(),
                        imageUrl: 'https://image.tmdb.org/t/p/w500' +
                            show.posterPath));
                  }
                  myfavoritesButton();
                },
                iconSize: 35.0,
                color: Colors.red[500],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                show.originalName.toUpperCase(),
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 12.0),
              Text(
                genre.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Year',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        show.firstAirDate.split('-')[0],
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Country',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        show.originalLanguage.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[],
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              Container(
                height: 120.0,
                child: SingleChildScrollView(
                  child: Text(
                    show.overview,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
