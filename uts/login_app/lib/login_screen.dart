import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.brown,
          primarySwatch: Colors.red,
          hintColor: Colors.blue),
      title: "Login Screen",
      home: LoginPageUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPageUI extends StatefulWidget {
  @override
  _LoginPageUIState createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {
  late BuildContext context;
  final FocusNode _passwordFocusNode = new FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return new Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new SingleChildScrollView(
          child: new Container(
            padding: EdgeInsets.fromLTRB(30, 110.0, 30, 20),
            child: new Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Email",
                      style: new TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      autofocus: true,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration:
                          InputDecoration(labelText: 'Enter your email id'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Password",
                      style: new TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                        focusNode: _passwordFocusNode,
                        controller: _passwordController,
                        textInputAction: TextInputAction.done,
                        decoration:
                            InputDecoration(labelText: 'Enter your password'),
                        keyboardType: TextInputType.text,
                        obscureText: true),
                  ],
                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 0)),
                ButtonTheme(
                  minWidth: double.maxFinite,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: showAlert,
                      child: new Text(
                        "Login with Email",
                        style:
                            new TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0)),
                ButtonTheme(
                  buttonColor: Colors.blueAccent,
                  minWidth: double.maxFinite,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: new Text(
                        "Login with Facebook",
                        style:
                            new TextStyle(color: Colors.white, fontSize: 20.0),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlert() {
    print("D");
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the user has typed in using our
          // TextEditingController
          title: new Text("Login Screen"),
          content: new Text("Email :" +
              _emailController.text +
              "\nPassword : " +
              _passwordController.text),
          actions: <Widget>[
            TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: Text('Ok'),
                onPressed: () {
                  _emailController.clear();
                  _passwordController.clear();
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }
}
