import 'dart:io';

import 'package:async/async.dart';
import 'package:backendappklient/backend/BackendDAO.dart';
import 'package:backendappklient/backend/Project.dart';
import 'package:backendappklient/widgets/ProjectGridItem.dart';
import 'package:flutter/material.dart';
import 'package:backendappklient/controller/Controller.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

Controller c = new Controller();
class Profile extends StatefulWidget {
  @override
  State createState() => new _ProfileTab();
}



class _ProfileTab extends State<Profile> with SingleTickerProviderStateMixin {
  List<Project> projects = c.getList(); // Get this from rest server
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> projectList = projects.map((p) => ProjectGridItem(project: p)).toList();
    // Get number of projects attached to user
    return GridView.count(crossAxisCount: 2,children: projectList);
  }

}
