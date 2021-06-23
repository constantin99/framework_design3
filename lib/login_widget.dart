//import 'package:framework_design3/Models/user.dart';
//import 'package:flutter/material.dart';
//import 'package:framework_design3/Notifiers/authentication_notifier.dart';
//import 'package:framework_design3/functions/authentication_api.dart';
//import 'package:provider/provider.dart';
//
//enum AuthMode { Signup, Login }
//
//class Login extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _LoginState();
//  }
//}
//
//class _LoginState extends State<Login> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  final TextEditingController _passwordController = new TextEditingController();
//  AuthMode _authMode = AuthMode.Login;
//
//  Users _user = Users();
//
//  @override
//  void initState() {
//    AuthenticationNotifier authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
//    initializeCurrentUser(authenticationNotifier);
//    super.initState();
//  }
//
//  void _submitForm() {
//    if (!_formKey.currentState!.validate()) {
//      return;
//    }
//
//    _formKey.currentState!.save();
//
//    AuthenticationNotifier authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
//
//    if (_authMode == AuthMode.Login) {
//      logIn(_user, authenticationNotifier);
//    } else {
//      signUp(_user, authenticationNotifier);
//    }
//  }
//
//
//
//  Widget _buildEmailField() {
//    return TextFormField(
//      decoration: InputDecoration(
//        labelText: "Email",
//        labelStyle: TextStyle(color: Colors.white54),
//      ),
//      keyboardType: TextInputType.emailAddress,
//      initialValue: 'julian@food.com',
//      style: TextStyle(fontSize: 26, color: Colors.white),
//      cursorColor: Colors.white,
//      validator: (value){
//        if(value!.isEmpty){
//          return "Email is required";
//        }
//      },
//
//      onSaved: (value) {
//        _user.email = value!;
//      },
//    );
//  }
//
//  Widget _buildPasswordField() {
//    return TextFormField(
//      decoration: InputDecoration(
//        labelText: "Password",
//        labelStyle: TextStyle(color: Colors.white54),
//      ),
//      style: TextStyle(fontSize: 26, color: Colors.white),
//      cursorColor: Colors.white,
//      obscureText: true,
//      controller: _passwordController,
//      validator: (value) {
//        if (value!.isEmpty) {
//          return 'Password is required';
//        }
//
//        if (value.length < 5 || value.length > 20) {
//          return 'Password must be betweem 5 and 20 characters';
//        }
//
//        return null;
//      },
//      onSaved: (value) {
//        _user.password = value!;
//      },
//    );
//  }
//
//  Widget _buildConfirmPasswordField() {
//    return TextFormField(
//      decoration: InputDecoration(
//        labelText: "Confirm Password",
//        labelStyle: TextStyle(color: Colors.white54),
//      ),
//      style: TextStyle(fontSize: 26, color: Colors.white),
//      cursorColor: Colors.white,
//      obscureText: true,
//      validator: (value) {
//        if (_passwordController.text != value) {
//          return 'Passwords do not match';
//        }
//
//        return null;
//      },
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    print("Building login screen");
//
//    return Scaffold(
//      body: Container(
//        constraints: BoxConstraints.expand(
//          height: MediaQuery.of(context).size.height,
//        ),
//        decoration: BoxDecoration(color: Color(0xff34056D)),
//        child: Form(
//          autovalidate: true,
//          key: _formKey,
//          child: SingleChildScrollView(
//            child: Padding(
//              padding: EdgeInsets.fromLTRB(32, 96, 32, 0),
//              child: Column(
//                children: <Widget>[
//                  Text(
//                    "Please Sign In",
//                    textAlign: TextAlign.center,
//                    style: TextStyle(fontSize: 36, color: Colors.white),
//                  ),
//                  SizedBox(height: 32),
//                  _authMode == AuthMode.Signup ?  _buildEmailField() : Container(),
//
//                  _buildPasswordField(),
//                  _authMode == AuthMode.Signup ? _buildConfirmPasswordField() : Container(),
//                  SizedBox(height: 32),
//                  ButtonTheme(
//                    minWidth: 200,
//                    child: RaisedButton(
//                      padding: EdgeInsets.all(10.0),
//                      child: Text(
//                        'Switch to ${_authMode == AuthMode.Login ? 'Signup' : 'Login'}',
//                        style: TextStyle(fontSize: 20, color: Colors.white),
//                      ),
//                      onPressed: () {
//                        setState(() {
//                          _authMode =
//                          _authMode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
//                        });
//                      },
//                    ),
//                  ),
//                  SizedBox(height: 16),
//                  ButtonTheme(
//                    minWidth: 200,
//                    child: RaisedButton(
//                      padding: EdgeInsets.all(10.0),
//                      onPressed: () => _submitForm(),
//                      child: Text(
//                        _authMode == AuthMode.Login ? 'Login' : 'Signup',
//                        style: TextStyle(fontSize: 20, color: Colors.white),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}














import 'package:framework_design3/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:framework_design3/Notifiers/authentication_notifier.dart';
import 'package:framework_design3/functions/authentication_api.dart';
import 'package:provider/provider.dart';

enum AuthMod {SignUp, Login}

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _LoginState();
  }
}

class _LoginState extends State<Login>{
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Users _user = Users();

  @override
  void initState(){
    AuthenticationNotifier authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
    initializeCurrentUser(authenticationNotifier);
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(("Login/Sign up")),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Please enter your email adress"
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Please enter your password"
                ),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width/3,
              color: Colors.blueGrey,
              child: TextButton(
                onPressed: (){
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

                  if(email.isEmpty){
                    print("Email is empty");
                  } else {
                    if(password.isEmpty){
                      print("Password is empty");
                    } else {
                      _user.email = email;
                      _user.password = password;
                      AuthenticationNotifier authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
                      logIn(_user, authenticationNotifier);
                    }
                  }
                },

                child: Text("Login"),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width/3,
              child: TextButton(
                onPressed: (){
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

                  if(email.isEmpty){
                    print("Please provide an email adress");
                  } else {
                    if (password.isEmpty) {
                      print("Please provide a password");
                    } else {
                      _user.email = email;
                      _user.password = password;
                      AuthenticationNotifier authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
                      signUp(_user, authenticationNotifier);
                    }
                  }
                },
                child: Text("Sign up"),
              ),
            )
          ],
        ),
      ),
    );
  }


}
