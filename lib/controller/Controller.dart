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
    print("login status: "+login.toString());
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

  Future<bool> addProject(Project projekt) async{
   bool a = await dao.addProject(projekt);
   print("boolean= "+a.toString());
   return a;
  }
  Future<bool> updateProject(Project projekt) async{
    bool u = await dao.updateProject(projekt);
    return u;
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



