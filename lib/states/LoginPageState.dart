import 'dart:core' as prefix0;
import 'dart:core';
import 'package:backendappklient/backend/BackendDAO.dart';
import 'package:backendappklient/backend/Project.dart';
import 'package:backendappklient/controller/Controller.dart';
import 'package:backendappklient/backend/user.dart';
import 'package:backendappklient/pages/MainTabs.dart';
import 'package:flutter/material.dart';
//other imports
import 'package:backendappklient/pages/loginpage.dart';
import 'package:backendappklient/Tabs/MyProjectsTab.dart';

Controller c = new Controller();
BackendDAO run = new BackendDAO();

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
// Create a global key that will uniquely identify the Form widget and allow us to validate the form
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: new Stack(
        fit: StackFit.expand, // Expands the background Image so it fits on the entire screen
        children: <Widget>[

          new Column(
            mainAxisAlignment: MainAxisAlignment.center, // Aligns logo to center
            children: <Widget>[
              new Form(
                key: _formKey, // Here is the form key inside the form
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark, primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(color: Colors.white,fontSize: 20.0))),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                            labelText: "Enter Username",
                              errorStyle: TextStyle(fontSize: 16.0),
                          ),
                          keyboardType: TextInputType.text,

                          controller: _username,

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Username incorrect.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 25.0,), // This creates an invisible box that creates a distance between the login fields
                        new TextFormField(
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                            labelText: "Enter Password",
                            errorStyle: TextStyle(fontSize: 18.0),
                          ),
                          keyboardType: TextInputType.text,

                          controller: _password,

                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password incorrect.';
                            }
                            return null;
                          },
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top:20.0),
                        ),
                        new MaterialButton(
                          minWidth: 500,
                          height: 50.0,
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          child: new Text("Login",
                          style: new TextStyle(fontSize: 18),
                          ),
                          onPressed: () async {
                            var loginUserCredentials = new User(_username.text,_password.text);
                            if (_formKey.currentState.validate()) {
                              //If the form is filled out, then go to profile page. In reality we need to check the username/password
                              //await c.logIn(loginUserCredentials)
                              if (await c.logIn(loginUserCredentials)) { // Check if the user exists
                                  //await c.getProject();
                                  print("Logging in with user: "+_username.text);
                                  c.setCurrentLoggedIn(_username.text);
                                  //Navigator.pushNamed(context, '/Profile Page');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TabLayout(username: _username.text),
                                      ),
                                    );
                                //Navigator.pushNamed(context, '/Profile Page');
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class roundBorder{
  WidgetBuilder(BuildContext context){
    border: new OutlineInputBorder(
      borderRadius: new BorderRadius.circular(25.0),
      borderSide: new BorderSide(
      ),
    );
  }
}

class SnackBarMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Message',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Message '),
        ),
      ),
    );
  }
}



























