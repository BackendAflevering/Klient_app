import 'package:backendappklient/Tabs/ProjectTab.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({this.project});
  String imgurl = "https://seeklogo.com/images/M/microsoft-project-msp-logo-0469E100B3-seeklogo.com.png";
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imgurl),
            ),
            title: Text(project.projectName),
            subtitle: Text(project.weekTime.toString()),
            trailing: Text(project.projectTime.toString()),
          )
        ],
      ),
    );
  }
}