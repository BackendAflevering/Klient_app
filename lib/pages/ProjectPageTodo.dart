import 'package:backendappklient/backend/Project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectDetailScreen extends StatelessWidget{
  final Project currentProject;
  ProjectDetailScreen({Key key,@required this.currentProject}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentProject.projektnavn),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
            'Projekt navn: '+currentProject.projektnavn+
            'Projekttid: '+currentProject.projekttid.toString()
        ),
        // Add more children with project values
      ),
    );
  }
}