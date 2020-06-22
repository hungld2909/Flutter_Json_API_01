import 'dart:convert';

import 'package:flutter/material.dart';
import 'error.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

import 'nasaCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Nasa>> nasa;
  final String uri = "https://apodapi.herokuapp.com/api/?count=5";
  Future<List<Nasa>> fetchNasa() async {
    var response = await http.get(uri);
    //todo: đọc đường link file json
    //todo: kiểm tra dữ liệu được trả về
    //todo: nếu bằng 200 thì dữ liệu được lấy về thành công.
    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body);
      if (jsonList is List) {
        //todo: sẽ lấy từng phần tử của json
        return jsonList
            .map((json) => Nasa.fromJson(json))
            .toList(); //todo: chuyển nó thành 1 list

      }
    }
    throw Exception("Http call not made");
  }

  @override
  void initState() {
    super.initState();
    nasa = fetchNasa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Infinity',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 16,
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.autorenew),
              onPressed: () {
                setState(() {
                  nasa =
                      fetchNasa(); //todo: khi ấn vào nut này nó sẽ sinh ra thêm 5 hình ngẫu nhiên nữa
                });
              })
        ],
      ),
      body: FutureBuilder(
          future: nasa,
          builder: (BuildContext context, AsyncSnapshot<List<Nasa>> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.all(16.0),
                children: snapshot.data
                    .map((nasa) => NasaCard(
                          nasa: nasa,
                        ))
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return ErrorPage(
                error: snapshot.error,
              );
            }
            else{
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              );
            }
          }),
    );
  }
}
