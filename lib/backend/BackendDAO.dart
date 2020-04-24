import 'dart:convert';
import 'dart:async';
import 'package:backendappklient/backend/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'Project.dart';


// TODO: HUSK AT SKIFT IP ADDRESSEN TIL DIN NUVÆRENDE IPV4 ADDRESSE!!!!
String SERVER_URL = "http://192.168.1.100:809";

class BackendDAO {
  Future<bool> checkLogin(User loginUser) async {
    var body = json.encode(loginUser);
    print("Her er body i BackendDAO: "+body);
    String username = loginUser.getUsername();
    String password = loginUser.getPassword();
    final response = await http
        .get(SERVER_URL + '/login?brugernavn='+username+'&kodeord='+password)
        .catchError((error) => print(error.toString()));
    print("response: "+response.body);
    if (response.statusCode == 200) {
      return true;
    }
    else {
      print('Login information incorrect');
      return false;
    }
  }

  Future<Project> getProjects(String id) async{
    final response = await http.get(SERVER_URL+"/getProjekt?projektID=waaac");
    print(response.body);
    Project projekt = Project.fromJson(jsonDecode(response.body));

    //list.add(Project.fromJson(jsonDecode(response.body)));
    return projekt;
  }

  Future<bool> addProject(Project projekt) async {
    var body = projekt.toJson();
    // make POST request
    //Response response = await post(SERVER_URL+"/nytprojekt", body: body);
    final response = await http
        .post(SERVER_URL + '/nytprojekt?projektnavn='+projekt.getProjektnavn()+'&projekttid='+projekt.getProjekttid().toString())
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



}
