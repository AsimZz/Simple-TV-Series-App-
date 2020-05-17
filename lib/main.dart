import 'package:flutter/material.dart';
import 'package:tv_series/UIs/home_page.dart';
import 'package:tv_series/UIs/login_page.dart';
import 'package:tv_series/blocs/tv_search_bloc/bloc/tv_search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/blocs/tv_series_bloc/bloc/tv_series_bloc.dart';
import 'UIs/search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Color(0xFFE43820),
        debugShowCheckedModeBanner: false,
        title: 'Tv Series App',
        theme: ThemeData(
          primaryColor: Color(0xFFFFFFFF),
          scaffoldBackgroundColor: Color(0xFF9E1F28),
        ),
        home: LoginPage()
        //BlocProvider(
        //   create: (context) => TvSearchBloc(),
        //   child: HomePage(),
        // )
        );
  }
}
