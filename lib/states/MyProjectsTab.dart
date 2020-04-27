import 'package:backendappklient/backend/Project.dart';
import 'package:backendappklient/pages/ProjectPageTodo.dart';
import 'package:backendappklient/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:backendappklient/controller/Controller.dart';
import 'package:flutter/widgets.dart';

Controller c = new Controller();
class Profile extends StatefulWidget {
  @override
  State createState() => new _ProfileTab();
}



class _ProfileTab extends State<Profile> with SingleTickerProviderStateMixin {

  Controller c = new Controller();
  List<Project> projects;
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    List<Project> projects = c.getOfflineProjects();
    return ListView.separated(
      itemCount: projects.length,
      itemBuilder: (context,index){
        return Container(
            decoration: BoxDecoration( //<-- BoxDecoration
              border: Border(bottom: BorderSide()),
            ),
          child:
          ListTile(
            title: Text(projects[index].getProjektnavn()),
            onTap: (){
              Project _current = projects[index];
              Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => ProjectDetailScreen(currentProject: _current,)
               )
              );
            },
          )
        );
      },
      separatorBuilder: (context,index){
        return Divider();
      },
    );
  }

  Color getProjectcolor(Project project){
    Color color;
    if(project.getProjektnavn().isNotEmpty){
      color = Colors.green;
    }
    return color;
  }

}
