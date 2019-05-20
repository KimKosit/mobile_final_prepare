import 'dart:async';
import 'package:sqflite/sqflite.dart';

final String tableData = "data";
final String columnId = "_id";
final String userId = "userid";
final String userName = "username";
final String userAge = "userage";
final String userPassWord = "password";

class Data {
  int id;
  String userid;
  String username;
  int userage;
  String userpassword;

  Data({this.id, this.userid, this.username, this.userage, this.userpassword});

  factory Data.fromMap(Map<String, dynamic> json) => new Data(
        id: json[columnId],
        userid: json[userId],
        username: json[userName],
        userage: json[userAge],
        userpassword: json[userPassWord],
      );

  Map<String, dynamic> toMap() => {
        userId: userid,
        userName: username,
        userAge: userage,
        userPassWord: userpassword,
      };
}

class DataProvider {
  static final DataProvider db = DataProvider();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await openDB("data.db");
      return _database;
    }
  }

  Future openDB(String path) async {
    return await openDatabase(path, version: 1,
        onCreate: (Database _database, int version) async {
      await _database.execute(
          '''create table $tableData ($columnId integer primary key autoincrement, $userId text not null, $userName text not null, $userAge integer not null, $userPassWord text not null)''');
    });
  }

  Future<Data> insert(Data data) async {
    final _database = await database;
    data.id = await _database.insert(tableData, data.toMap());
    return data;
  }

  Future<List<Data>> getAll() async {
    await this.openDB("data.db");
    final _database = await database;
    var result = await _database.query(tableData);

    List<Data> userList =
        result.isNotEmpty ? result.map((c) => Data.fromMap(c)).toList() : [];

    return userList;
  }

  Future close() async => _database.close();
}
