import 'package:flutter/material.dart';
import 'package:mobilefinal/model/data.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formkey = new GlobalKey<FormState>();
  DataProvider data = DataProvider();
  String userId, passWord;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              Image.network(
                "https://www.jobsexpo.ie/wp-content/uploads/2015/11/Apple.png",
                height: 200,
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "User Id",
                  ),
                  onSaved: (value) {
                    userId = value;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: "Password",
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    passWord = value;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text("LOGIN"),
                  onPressed: () {
                    _formkey.currentState.save();
                    if (userId == '' || passWord == '') {
                      Toast.show("Please fill out this form", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Register New Account",
                    style: TextStyle(color: Colors.teal),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text("Show data"),
                  onPressed: () async {
                    data.openDB("data.db");
                    Future<List<Data>> allUser = data.getAll();
                    Future showAllUser() async {
                      var userList = await allUser;
                      for (var i = 0; i < userList.length; i++) {
                        print(userList[i].id);
                      }
                    }

                    await showAllUser();
                  },
                ),
              )
            ],

            //   children: <Widget>[
            //     Image.network(
            //       "https://www.jobsexpo.ie/wp-content/uploads/2015/11/Apple.png",
            //       height: 200,
            //     ),
            //     TextFormField(
            //       controller: userId,
            //       decoration: InputDecoration(labelText: "User Id"),
            //       validator: (value) {
            //         if (value.isEmpty) {
            //           Toast.show("Please fill out this form", context,
            //               duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
            //         }
            //       },
            //     ),
            //     TextFormField(
            //       controller: password,
            //       decoration: InputDecoration(labelText: "Password"),
            //       obscureText: true,
            //       validator: (value) {
            //         if (value.isEmpty) {
            //           Toast.show("Please fill out this form", context,
            //               duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
            //         }
            //       },
            //     ),
            //     Row(
            //       children: <Widget>[
            //         Expanded(
            //           flex: 1,
            //           child: RaisedButton(
            //             child: Text("LOGIN"),
            //             onPressed: () {
            //               _formkey.currentState.validate();
            //             },
            //           ),
            //         )
            //       ],
            //     ),
            //   ],
          ),
        ),
      ),
    );
  }
}
