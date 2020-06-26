import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:movil/main.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  SharedPreferences sharedPreferences;
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('token');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => LoginApp()));
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}


