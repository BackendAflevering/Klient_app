import 'package:backendappklient/backend/Project.dart';
import 'package:backendappklient/pages/ProjectPageTodo.dart';
import 'package:backendappklient/pages/MainTabs.dart';
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
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    String username = c.getCurrentLoggedInUser();
    return FutureBuilder<List<Project>>(
      future: dao.getUserProjects(username),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Project> data = snapshot.data;
          return _projectsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  _projectsListView(List<Project> projects){
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
/*
List<Project> projects;
    print(projects);
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
 */