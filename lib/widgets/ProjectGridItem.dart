import 'package:backendappklient/backend/Project.dart';
import 'package:flutter/cupertino.dart';

class ProjectGridItem extends StatelessWidget{
  Project project;

  ProjectGridItem({this.project});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Text(project.projektnavn),
    );
  }

}