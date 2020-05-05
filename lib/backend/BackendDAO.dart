import 'dart:convert';
import 'dart:async';
import 'package:backendappklient/backend/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'Project.dart';


// TODO: HUSK AT SKIFT IP ADDRESSEN TIL DIN NUVÆRENDE IPV4 ADDRESSE!!!!
String SERVER_URL = "http://ec2-13-48-130-164.eu-north-1.compute.amazonaws.com:80";
String LOCALHOST_URL = "http://192.168.1.100:8080";
class BackendDAO {
  Project _project;

  Future<bool> checkLogin(User loginUser) async {
    var body = json.encode(loginUser);
    print("Her er body i BackendDAO: "+body);
    String username = loginUser.getUsername();
    String password = loginUser.getPassword();
    final response = await http
        .post(LOCALHOST_URL + '/login?brugernavn='+username+'&kodeord='+password)
        .catchError((error) => print(error.toString()));
    print("response: "+response.statusCode.toString());
    if (response.statusCode == 200) {
      return true;
    }
    else {
      print('Login information incorrect');
      return false;
    }
  }

  Future<Project> getProjects(String id) async{
    final response = await http.get(LOCALHOST_URL+"/getBrugerProjekt?projektID="+id);
    var responseJson = json.decode(response.body);
    print(responseJson);
    Project projekt = Project.fromJson(jsonDecode(response.body));
    print("got Project successfully");
    print(projekt.toString());
    //list.add(Project.fromJson(jsonDecode(response.body)));
    _project = projekt;
    return projekt;
  }

  Future<List<Project>> getUserProjects(String username) async {
    var response = await http.get(LOCALHOST_URL+"/getAlleBrugerProjekter?brugernavn="+username);
    Iterable iterable;
    if (response.statusCode == 200){
      List<Project> projects = new List<Project>();
      iterable = (json.decode(response.body)as List).map((i) => Project.fromJson(i));
      for(int i = 0; i < iterable.length; i++){
        Project project = iterable.elementAt(i);
        print(project.getProjektnavn());
        projects.add(project);
      }
    return projects;
    } else {
      print("Something went wrong with the connection");
      return null;
    }
  }

  Future<bool> addProject(Project projekt) async {
    var body = json.encode(projekt.toJson());
    print("Trying to add this project body:");
    print(projekt.toJson());
    // make POST request
    //Response response = await post(SERVER_URL+"/nytprojekt", body: body);
    final response = await http
        .post(LOCALHOST_URL + '/nytProjekt',body: body)
        .catchError((error) => print(error.toString()));
    print("Response is: ");
    print(response.body);
    if(response.statusCode==200){
      print("Project sent to server!");
      return true;
    }
    print("Project did not send");
    return false;
  }
  Future<bool> updateProject(Project projekt) async{
    final response = await http
        .post(LOCALHOST_URL + '/opdaterProjekt?projektnavn='+projekt.getProjektnavn()+'&projekttid='+projekt.getProjekttid().toString()+'&medlemmer='+projekt.getMedlemmer().toString())
        .catchError((error) => print(error.toString()));
    if(response.statusCode==200){
      print("Project updated successfully!!");
      return true;
    }
    print("Project did not update");
    return false;
  }


}
