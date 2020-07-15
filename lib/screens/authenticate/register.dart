import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email;
  String password;
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign up '.toUpperCase()),
              // centerTitle: true,
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Sign in'.toUpperCase())),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: buildInputDecoration().copyWith(
                        hintText: 'Enter email'.toUpperCase(),
                      ),
                      validator: (val) =>
                          ((val.isEmpty) ? 'Enter the email' : null),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      decoration: buildInputDecoration().copyWith(
                        hintText: 'Enter password'.toUpperCase(),
                      ),
                      validator: (val) => ((val.length < 6
                          ? 'Enter the password with 6+ characters'
                          : null)),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          // print('result : $result');
                          if (result == null) {
                            setState(() {
                              error = 'Please Supply Valid Email';
                              loading = false;
                            });
                          }
                        }
                      },
                      color: Colors.red,
                      child: Text(
                        'Register'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
