import 'package:app_nasa_restApi/model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailPage extends StatelessWidget {
  final Nasa nasa;

  const DetailPage({Key key, this.nasa}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nasa.title),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Hero(
                tag: nasa.date,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: nasa.url,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text(
                  nasa.date.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Spacer(),
                Container(
                  width: 200,
                  child: Text(
                    "${nasa.copyright}",
                    softWrap: true,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Text(
              nasa.description,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
