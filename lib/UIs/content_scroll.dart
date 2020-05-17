import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:tv_series/UIs/list_tv_series.dart';
import 'package:tv_series/UIs/tv_series_list.dart';
import 'package:tv_series/UIs/tv_series_page.dart';

class ContentScroll extends StatelessWidget {
  final List<ListTv> images;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScroll({
    this.images,
    this.title,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF9E1F28),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TvSeriesList(
                                images: images,
                              )));
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF9E1F28),
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                width: imageWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new TvSeriesPage(
                                    tvId: int.parse(images[index].id),
                                  )));
                    },
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: images[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
