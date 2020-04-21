import 'dart:convert';
import 'dart:async';
import 'package:backendappklient/backend/user.dart';
import 'package:http/http.dart' as http;

import 'Project.dart';


// TODO: HUSK AT SKIFT IP ADDRESSEN TIL DIN NUVÆRENDE IPV4 ADDRESSE!!!!
String SERVER_URL = "http://192.168.1.100:8091";

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

  Future<List<Project>> getProjects(String id) async{
    final response = await http.get(SERVER_URL+"/getProjekt?projektID="+id);
    print(response.body);
    List<Project> list;
    list.add(Project.fromJson(jsonDecode(response.body)));
    return list;
  }




}
