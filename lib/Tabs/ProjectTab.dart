import 'dart:io';

import 'package:async/async.dart';
import 'package:backendappklient/Cards/ProjectCard.dart';
import 'package:backendappklient/backend/BackendDAO.dart';
import 'package:flutter/material.dart';
import 'package:backendappklient/controller/Controller.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

Controller c = new Controller();
BackendDAO b = new BackendDAO();
class ProjectTab extends StatefulWidget {
  @override
  State createState() => new _ProjectTabState();
}
//TODO: Be able to edit and invite other users to this project

//TODO: Features ; 1) Add amount of hours a user has used on this project
//TODO: Features ; 2) See how many hours an individual user has used on the project
final String projectName="Project Alpha";
final String projectType="Creative";
final String year="2020";


class _ProjectTabState extends State<ProjectTab> with SingleTickerProviderStateMixin {

  List<Project> projectList = getUserProjects();
  Widget _build(){
    return Container(
      child: projectList.length > 0
      ? ListView.builder(
        itemCount: projectList.length,
        itemBuilder: (BuildContext context, int index) {
        return Dismissible(
        onDismissed: (DismissDirection direction) {
        setState(() {
        projectList.removeAt(index);
        });
        },
        secondaryBackground: Container(
        child: Center(
        child: Text(
        'Delete',
        style: TextStyle(color: Colors.white),
          ),
        ),
     color: Colors.red,
    ),
    background: Container(),
    child: ProjectCard(project: projectList[index]),
    key: UniqueKey(),
    direction: DismissDirection.endToStart,
    );
    },
  )
      : Center(child: Text('No Items')),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
      ),
      body: _build(),
    );
  }

}

  List<Project> getUserProjects(){
    List<Project> projects;

    projects.add(new Project(projectName: "Project Alpha",weekTime: 42,projectTime: 75));
    projects.add(new Project(projectName: "Project Beta",weekTime: 42,projectTime: 75));
    projects.add(new Project(projectName: "Project Gamma",weekTime: 42,projectTime: 75));

  }

class ProjectList {
  static List<Project> getProjects(){
    return [
      Project(
        projectName: "Project Alpha",
        weekTime: 42,
        projectTime: 72
      ),
      Project(
          projectName: "Project Beta",
          weekTime: 42,
          projectTime: 72
      ),
      Project(
          projectName: "Project Gamma",
          weekTime: 42,
          projectTime: 72
      ),
    ];
  }
}

class Project{
  final String projectName;
  final int weekTime;
  final int projectTime;

  Project({this.projectName,this.weekTime,this.projectTime});
}

