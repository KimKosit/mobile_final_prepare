import 'package:flutter/material.dart';
import '../model/data.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final _formkey = new GlobalKey<FormState>();

  TextEditingController userId = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userAge = TextEditingController();
  TextEditingController userPassWord = TextEditingController();

  DataProvider db = DataProvider();

  List<Data> users = List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: TextFormField(
                  controller: userId,
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
                  controller: userName,
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
                  controller: userAge,
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
                  controller: userPassWord,
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
                margin: const EdgeInsets.only(top: 10),
                child: RaisedButton(
                  child: Text("REGISTER NEW ACCOUNT"),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      await db.insert(Data(
                        userid: userId.text,
                        username: userName.text,
                        userage: int.parse(userAge.text),
                        userpassword: userPassWord.text,
                      ));
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
