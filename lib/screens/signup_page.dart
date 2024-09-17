import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _password, _email, _phone, _profession;
  List<String> professions = ['Developer', 'Designer', 'Manager'];

  _saveToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _name.toString());
    prefs.setString('password', _password.toString());
    prefs.setString('email', _email.toString());
    prefs.setString('phone', _phone.toString());
    prefs.setString('profession', _profession.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text('Signup'),backgroundColor: Colors.blueGrey,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username', // Label text above the field
                    hintText: 'Enter your username', // Placeholder text inside the field
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
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) => _email = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone'),
                  onSaved: (value) => _phone = value,
                ),
                DropdownButtonFormField(
                  items: professions.map((profession) {
                    return DropdownMenuItem(value: profession, child: Text(profession));
                  }).toList(),
                  onChanged: (value) => _profession = value,
                  decoration: InputDecoration(labelText: 'Profession'),
                ),
                SizedBox(height: 130,),
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
                    _saveToLocal();
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     _formKey.currentState!.save();
                //     _saveToLocal();
                //     Navigator.pushNamed(context, '/login');
                //   },
                //   child: Text('Signup'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
