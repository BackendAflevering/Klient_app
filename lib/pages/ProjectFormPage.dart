// Define a custom Form widget.
import 'package:backendappklient/backend/Project.dart';
import 'package:backendappklient/controller/Controller.dart';
import 'package:flutter/material.dart';

class ProjectForm extends StatefulWidget {

  @override
  ProjectFormState createState() {
    return ProjectFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ProjectFormState extends State<ProjectForm> {
  final _projektnavn = TextEditingController();
  final _projekttid = TextEditingController();
  final _medlemmer = TextEditingController();
  List<String> medlemmer = new List();
  Controller c = new Controller();
  TextEditingController _controller = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
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

              labelStyle: TextStyle(fontSize: 25),
              labelText: "Project Name",
              hintText: 'e.g Awesome Project X',

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
              labelStyle: TextStyle(fontSize: 25),
              labelText: "Project time",
              hintText: 'e.g 6 hours',

            ),
            keyboardType: TextInputType.text,
            controller: _projekttid,
          ),

          new TextFormField(
            onChanged: (text){
            },
            validator: (value){
              if(value.isEmpty){
                return 'Enter this field';
              }
              return null;
            },
            decoration: new InputDecoration(
                labelStyle: TextStyle(fontSize: 25),
                labelText: "Members",
                hintText: '(You can only add 1 member at this time)'
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
              child: new Text("Create Project"),
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

                  Scaffold
                  .of(context)
                      .showSnackBar(SnackBar(content: Text('Processing new Project'),));
                }
              },
          ),
          )],
      ),
    );
  }

  void onChange(){
    String text = _controller.text;

  }
}