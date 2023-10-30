import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
        primarySwatch: Colors.red,
        hintColor: Colors.blue,
      ),
      title: "Sign Up Screen",
      home: SignUpUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpUI extends StatefulWidget {
  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late String _fname;
  late String _lname;
  late String _mobile;
  late String _email;
  late String _password;
  late String _conpassword;
  late String _address;

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPasswordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(25, 60.0, 25, 20),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                Form(
                  key: _formKey,
                  autovalidateMode: _autoValidate
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: FormUI(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Sign Up"),
          content: Text(
              "First Name: $_fname\nLast Name: $_lname\nMobile Number: $_mobile\nEmail: $_email\nPassword: $_password\nAddress: $_address"),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                _fnameController.clear();
                _lnameController.clear();
                _mobileController.clear();
                _emailController.clear();
                _passwordController.clear();
                _conPasswordController.clear();
                _addressController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showAlert();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget FormUI() {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: _fnameController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'First Name',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.account_box),
          ),
          keyboardType: TextInputType.text,
          validator: validateName,
          onSaved: (String? val) {
            _fname = val ?? '';
          },
        ),
        TextFormField(
          controller: _lnameController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Last Name',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.account_box),
          ),
          keyboardType: TextInputType.text,
          // No validation for last name in this example
          // onSaved: (String? val) {
          //   _lname = val ?? '';
          // },
        ),
        TextFormField(
          controller: _mobileController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Mobile Number',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.add_call),
          ),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          onSaved: (String? val) {
            _mobile = val ?? '';
          },
        ),
        TextFormField(
          controller: _emailController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.alternate_email),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String? val) {
            _email = val ?? '';
          },
        ),
        TextFormField(
          obscureText: true,
          controller: _passwordController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.pages),
          ),
          keyboardType: TextInputType.text,
          validator: validatePassword,
          onSaved: (String? val) {
            _password = val ?? '';
          },
        ),
        TextFormField(
          obscureText: true,
          controller: _conPasswordController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Confirm Password',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.pages),
          ),
          keyboardType: TextInputType.text,
          validator: validateConPassword,
          onSaved: (String? val) {
            _conpassword = val ?? '';
          },
        ),
        TextFormField(
          controller: _addressController,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            labelText: 'Address',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.home),
          ),
          keyboardType: TextInputType.text,
          onSaved: (String? val) {
            _address = val ?? '';
          },
        ),
        Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0)),
        ButtonTheme(
          buttonColor: Colors.blueAccent,
          minWidth: 300,
          height: 50.0,
          child: ElevatedButton(
            onPressed: _validateInputs,
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
  }

  String? validateName(String? value) {
    if (value == null || value.length < 3)
      return 'First name must be more than 3 characters';
    return null;
  }

  String? validateMobile(String? value) {
    if (value == null || value.length != 10)
      return 'Mobile number must be 10 characters';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || !value.contains('@'))
      return 'Enter a valid email address';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().length < 6)
      return 'Password must be at least 6 characters';
    return null;
  }

  String? validateConPassword(String? value) {
    if (value != _passwordController.text) return 'Passwords do not match';
    return null;
  }
}
