import 'package:backendappklient/pages/ProjectFormPage.dart';
import 'package:backendappklient/states/ProfileTab.dart';
import 'package:flutter/material.dart';

//next level

class TabLayout extends StatelessWidget {
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
                Tab(icon: Icon(Icons.account_box),text: "Profil",),
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
}

