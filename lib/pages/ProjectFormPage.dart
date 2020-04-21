// Define a custom Form widget.
import 'package:backendappklient/backend/Project.dart';
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

  TextEditingController _controller = new TextEditingController();
  FocusNode _projectNameFocus = new FocusNode();
  FocusNode _projectTimeFocus = new FocusNode();
  FocusNode _membersFocus = new FocusNode();


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
              child: new Text("Create Project"),
              onPressed: (){
                if(_formKey.currentState.validate()){
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