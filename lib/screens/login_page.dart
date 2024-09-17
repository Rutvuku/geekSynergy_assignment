import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _password;

  _validateLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedName = prefs.getString('name').toString();
    String savedPassword = prefs.getString('password').toString();

    if (_name == savedName && _password == savedPassword) {
      Navigator.pushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),backgroundColor: Colors.blueGrey,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username', // Label text above the field
                  hintText: 'Enter Your Username', // Placeholder text inside the field
                  prefixIcon: Icon(Icons.person), // Icon at the beginning of the field
                  suffixIcon: Icon(Icons.check_circle), // Icon at the end of the field
                  filled: true, // Whether the field should have a background color
                  fillColor: Colors.grey[200], // Background color of the field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded border radius
                    borderSide: BorderSide(
                      color: Colors.blueAccent, // Border color
                      width: 2, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.blueAccent, // Color of the border when not focused
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.green, // Color of the border when focused
                      width: 2,
                    ),
                  ),
                ),
                onSaved: (value) => _name = value,
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password', // Label text above the field
                  hintText: 'Enter Your Password', // Placeholder text inside the field
                  prefixIcon: Icon(Icons.person), // Icon at the beginning of the field
                  suffixIcon: Icon(Icons.check_circle), // Icon at the end of the field
                  filled: true, // Whether the field should have a background color
                  fillColor: Colors.grey[200], // Background color of the field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded border radius
                    borderSide: BorderSide(
                      color: Colors.blueAccent, // Border color
                      width: 2, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.blueAccent, // Color of the border when not focused
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.green, // Color of the border when focused
                      width: 2,
                    ),
                  ),
                ),
                obscureText: true,
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 30,),
              CustomButton(
                width: 300,
                gradient:
                const LinearGradient(colors: [Colors.blue, Colors.purple]),
                //backgroundColor: Colors.blueAccent,
                isThreeD: true,
                height: 50,
                borderRadius: 25,
                animate: true,
                margin: const EdgeInsets.all(10),
                onPressed: () {
                  _formKey.currentState!.save();
                  _validateLogin();
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     _formKey.currentState!.save();
              //     _validateLogin();
              //   },
              //   child: Text('Login'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
