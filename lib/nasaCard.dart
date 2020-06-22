import 'package:app_nasa_restApi/detail.dart';
import 'package:app_nasa_restApi/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_ink_well/image_ink_well.dart';

class NasaCard extends StatelessWidget {
  final Nasa nasa;

  const NasaCard({Key key, this.nasa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16.0,
      margin: EdgeInsets.all(12),
      color: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 400,
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                ),
              ),
              Hero(
                tag: nasa.date,
                child: RoundedRectangleImageInkWell(
                  image: CachedNetworkImageProvider(nasa.url),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contex) => DetailPage(
                                  nasa: nasa,
                                )));
                  },
                  width: 400,
                  height: 300,
                  fit: BoxFit.cover,
                  backgroundColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
          Text(
            nasa.title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
