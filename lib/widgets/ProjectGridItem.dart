import 'package:backendappklient/backend/Project.dart';
import 'package:flutter/cupertino.dart';

class ProjectGridItem extends StatelessWidget{
  static Set<String> medlemmer = {"Mark","Jenje"};
  Project project;
  Project project1 = new Project("Front-end Projekt",2,medlemmer);
  Project project2 = new Project("Back-end Projekt",12,medlemmer);
  ProjectGridItem({this.project});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Text(project.projektnavn),
    );
  }

}