import 'dart:io';

import 'package:async/async.dart';
import 'package:backendappklient/backend/BackendDAO.dart';
import 'package:backendappklient/backend/user.dart';
import 'package:flutter/material.dart';
import 'package:backendappklient/controller/Controller.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

Controller c = new Controller();
BackendDAO b = new BackendDAO();
class Profile extends StatefulWidget {
  @override
  State createState() => new _ProfileTab();
}



class _ProfileTab extends State<Profile> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _guess = TextEditingController();
  User testUser;
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String imgUrl = 'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg';
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tab 1 Layout (Profile name): "),
          new Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: new FlatButton.icon(
              onPressed: () {
                // TODO: Actually log out of the backend system
                // c.logOut(testUser);
                Navigator.pushNamed(context, '/home');
              },
              color: Colors.blueAccent,
              textColor: Colors.white,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              icon: const Icon(Icons.hotel, size: 18.0),
              label: const Text('Log out'),
            ),
          ),
        ],
      ),
    );
  }


  Widget rowCell(int count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.white),),
    new Text(type,style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
}
