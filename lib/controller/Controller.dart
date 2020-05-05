import 'dart:async';
import 'package:backendappklient/backend/Project.dart';
import 'package:backendappklient/backend/user.dart';
import 'package:backendappklient/backend/BackendDAO.dart';

BackendDAO dao = new BackendDAO();

class Controller {
  // Constructor
  Project _project;
  Project projekt;
  List<Project> _projectList;
  static String _username;

  Controller();
  // methods
  Future<bool> logIn(User loginUser) async{
    bool login = await dao.checkLogin(loginUser); // Receive user from server
    return login;
  }

  Future<Project> getProject()async{
    _project = await dao.getProjects("waaac");
    print(projekt.getProjektnavn());
    return _project;
  }

  List<Project> getList(){
    return _projectList;
  }

  Future addProject(Project projekt) async{
   bool b = await dao.addProject(projekt);
   print("boolean= "+b.toString());
  }

  Future<List<Project>> getLoggedInProjects(String username) async{
    List<Project> projects = await dao.getUserProjects(username);
    return projects;
  }
  void setCurrentLoggedIn(String username){
    print("setting username: "+username);
    _username = username;
  }

  String getCurrentLoggedInUser(){
    print("returning username: "+_username);
    return _username;
  }
}



