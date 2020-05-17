import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/bloc.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/tv_search_bloc.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/tv_search_event.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/tv_search_state.dart';
import 'tv_series_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'list_tv_series.dart';
import 'content_scroll.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  ListTv _popularTv;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Bloc<TvSearchEvent, TvSearchState> tv_bloc;

  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _popularTvShows(int index) {
    List<ListTv> l = popular;
    List<ListTv> newList = [];
   
      Random rand = new Random();

      for (int i = 0; i < 3; i++) {
        
        int randomIndex = rand.nextInt(l.length);

        newList.add(l[randomIndex]);

        l.remove(randomIndex);
      }
    

    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute<TvSeriesPage>(builder: (context) {
          return BlocProvider.value(
            value: tv_bloc,
            child: TvSeriesPage(
              tvId: int.parse(newList[index].id),
            ),
          );
        })),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: newList[index].imageUrl,
                      height: 220.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  newList[index].title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'TV SHOW APP',
          style: TextStyle(
              color: Color(0xFF9E1F28),
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () => print('Menu'),
          icon: Icon(
            Icons.menu,
            color: Color(0xFF9E1F28),
          ),
          iconSize: 30.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () async {
              await showSearch(
                  context: context,
                  delegate:
                      TvSearchPage(BlocProvider.of<TvSearchBloc>(context)));
            },
            icon: Icon(
              Icons.search,
              color: Color(0xFF9E1F28),
            ),
            iconSize: 30.0,
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280.0,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return _popularTvShows(index);
              },
            ),
          ),
          Container(
            height: 90.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFD45253),
                        Color(0xFF9E1F28),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF9E1F28),
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      labels[index].toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          ContentScroll(
            images: myList,
            title: 'My List',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
          SizedBox(height: 10.0),
          ContentScroll(
            images: favorites,
            title: 'Favorites',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
        ],
      ),
    );
  }
}
