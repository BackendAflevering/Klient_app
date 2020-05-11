import 'package:backendappklient/backend/Project.dart';
import 'package:backendappklient/controller/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectDetailScreen extends StatelessWidget{
  final Project currentProject;
  Controller c = new Controller();
  ProjectDetailScreen({Key key,@required this.currentProject}) : super(key:key);
  final _projektnavn = TextEditingController();
  final _projekttid = TextEditingController();
  final _medlemmer = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget updateProjectForm(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 100),
          new TextFormField(

            validator: (value){
              if(value.isEmpty){
                return 'Enter this field';
              }
              return null;
            },
            decoration: new InputDecoration(

              labelStyle: TextStyle(fontSize: 18),
              labelText: 'Projektnavn: '+currentProject.getProjektnavn(),

            ),
            keyboardType: TextInputType.number,
            controller: _projektnavn,
          ),
          new TextFormField(
            validator: (value){
              if(value.isEmpty){
                return 'Enter this field';
              }
              return null;
            },
            decoration: new InputDecoration(
              labelStyle: TextStyle(fontSize: 18),
              labelText: 'Projekttid: '+currentProject.getProjekttid().toString(),
              hintText: 'e.g 6 hours',

            ),
            keyboardType: TextInputType.text,
            controller: _projekttid,
          ),

          new TextFormField(
            onSaved: (text){
            },
            validator: (value){
              if(value.isEmpty){
                return 'Enter this field';
              }
              return null;
            },
            decoration: new InputDecoration(
                labelStyle: TextStyle(fontSize: 18),
                labelText: 'Medlemmer: '+currentProject.getMedlemmer().toString(),
                hintText: 'e.g Goku, Vegeta'
            ),
            keyboardType: TextInputType.text,
            controller: _medlemmer,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: new MaterialButton(
              minWidth: 500,
              height: 50.0,
              color: Colors.white,
              textColor: Colors.blue,
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              child: new Text("Update Project"),
              onPressed: (){
                String projektNavn = _projektnavn.text;
                String projektTid = _projekttid.text;
                String members =_medlemmer.text;
                print("Sender navn, tid og members til server: "+projektNavn+", "+projektTid.toString());
                if(_formKey.currentState.validate()){
                  List<String> medlemmerList = new List();
                  medlemmerList.add(members);
                  int number = int.parse(_projekttid.text);
                  Project projekt = new Project(_projektnavn.text,number,medlemmerList);
                  c.addProject(projekt);
                }
              },
            ),
          )],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentProject.projektnavn),
      ),
      body: updateProjectForm()
    );
  }
}