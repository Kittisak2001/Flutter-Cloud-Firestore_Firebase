import 'package:flutter/material.dart';
import 'package:flutter_firebase/model/Student.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();

  Student myStudent = Student();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scorce Quiz Form"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "First Name",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator: RequiredValidator(
                        errorText: "Please enter your First Name."),
                    onSaved: (String? fname) {
                      myStudent.fname = fname;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Last Name",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator: RequiredValidator(
                        errorText: "Please enter your Last Name."),
                    onSaved: (String? lname) {
                      myStudent.lname = lname;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator: MultiValidator(
                      [
                        EmailValidator(errorText: "@ email format is invalid."),
                        RequiredValidator(
                            errorText: "Please enter your Email.")
                      ],
                    ),
                    onSaved: (String? email) {
                      myStudent.email = email;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Score",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator: RequiredValidator(
                        errorText: "Please enter your Score."),
                    onSaved: (String? score) {
                      myStudent.score = score;
                    },
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print(
                              "Data = ${myStudent.fname} ${myStudent.lname} ${myStudent.email} ${myStudent.score}");
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
