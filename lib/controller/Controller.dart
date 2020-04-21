import 'dart:async';
import 'package:backendappklient/backend/Project.dart';
import 'package:backendappklient/backend/user.dart';
import 'package:backendappklient/backend/BackendDAO.dart';

BackendDAO dao = new BackendDAO();

class Controller {
  // Constructor
  Project _project;
  List<Project> _projectList;
  Controller();
  // methods
  Future<bool> logIn(User loginUser) async{
    bool login = await dao.checkLogin(loginUser); // Receive user from server
    return login;
  }

  Future<List<Project>> getProject()async{
    List<Project> projects = await dao.getProjects("1");
    print("Here is our project: "+projects.toString());
    _projectList = projects;
    return projects;
  }

  List<Project> getList(){
    return _projectList;
  }
}



