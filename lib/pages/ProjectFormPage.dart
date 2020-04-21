// Define a custom Form widget.
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
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>[
              // Add TextFormFields and RaisedButton here.
              form1(context)
            ]
        )
    );
  }

  Widget form1(BuildContext context){
    TextFormField(
      validator: (value){
        if(value.isEmpty){
          return 'Please enter some text';
        }
      },
    );
  }
}