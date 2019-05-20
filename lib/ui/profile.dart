import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  final _formkey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), hintText: "User Id"),
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter User Id";
                    else if (value.length < 6 || value.length > 12)
                      return "User Id must be 6-12 characters long";
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_circle), hintText: "Name"),
                  validator: (value) {
                    var check = value.split(" ");
                    if (value.isEmpty)
                      return "Please enter Name";
                    else if (check.length != 2)
                      return "Name and surname must be seperate by space";
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), hintText: "Age"),
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter age";
                    else if (int.parse(value) < 10 || int.parse(value) > 80)
                      return "Age must be 10-80";
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock), hintText: "Password"),
                  validator: (value) {
                    if (value.isEmpty)
                      return "Please enter Password";
                    else if (value.length < 6)
                      return "Password must be more than 6 characters long";
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      icon: Icon(Icons.format_quote), hintText: "Quote"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: RaisedButton(
                  child: Text("Save"),
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
