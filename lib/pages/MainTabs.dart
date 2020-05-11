import 'package:backendappklient/backend/Project.dart';
import 'package:backendappklient/controller/Controller.dart';
import 'package:backendappklient/pages/ProjectFormPage.dart';
import 'package:backendappklient/Tabs/MyProjectsTab.dart';
import 'package:flutter/material.dart';

//next level

class TabLayout extends StatelessWidget {
  String username;
  TabLayout({Key key,@required this.username}) : super(key: key);
  Controller c = new Controller();
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(

            // This removes the back button so that you can only reach the login page by logging out.
            actions: <Widget>[
              new IconButton(
                icon: new Icon(null),
              ),
            ],
            leading: new Container(),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_box),text: "Mine projekter (" + username+")"),
                Tab(icon: Icon(Icons.access_alarm),text: "Nyt Project",)
              ],
            ),
          ),

          body: new TabBarView(
            children:<Widget>[ // Each child is the content for each of the 3 tabs.
              new Profile(),
              new ProjectForm()
            ],
          )),

        );
  }
  String getUsername(){
    return username;
  }
}

