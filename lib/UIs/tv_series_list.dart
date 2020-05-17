import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:tv_series/UIs/tv_series_page.dart';
import 'list_tv_series.dart';

class TvSeriesList extends StatelessWidget {
  final List<ListTv> images;
  final double imageHeight;
  final double imageWidth;

  const TvSeriesList(
      {Key key, @required this.images, this.imageHeight, this.imageWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xFF9E1F28),
            expandedHeight: 125.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'SliverAppBar',
              ),
            ),
          ),
          SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.65),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  height: 520,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
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
              }, childCount: images.length)),
        ],
      ),
    );
  }
}
