import 'package:flutter/material.dart';
class ErrorPage extends StatelessWidget {
 final error;
 final String title;

  const ErrorPage({Key key, this.error, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(horizontal: 48,vertical: 32),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.error, color: Colors.black,size: 72,),
          SizedBox(height: 20,),
          Text(this.title,style: TextStyle(color: Colors.white),),
          SizedBox(height: 20,),
          Text(error.toString(),style: TextStyle(color: Colors.white,),),
          

        ],
      ),
    );
  }
}