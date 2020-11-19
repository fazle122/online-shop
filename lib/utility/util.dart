import 'package:flutter/material.dart';

class Util{

  static final String baseUrl = 'https://flutter-firebase-22e44.firebaseio.com/';
  static final String authUrl = 'https://identitytoolkit.googleapis.com/v1/';


  static void showErrorDialog(BuildContext context,String title,String message) {
    showDialog(context: context,
        builder: (ctx) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(child: Text('ok'),onPressed: (){
              Navigator.of(ctx).pop();
            },
          )
        ],));
  }

  static Widget loadingIndicator(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }


}