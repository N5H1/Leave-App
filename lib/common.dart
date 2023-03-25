import 'package:flutter/material.dart';
import 'package:flutter_leave/main.dart';

class AppCommon {
  static var connection;
}

showLoAlert(BuildContext context1) {
  showDialog(
      context: context1,
      builder: (BuildContext context2) {
        return AlertDialog(
          // ignore: prefer_const_constructors
          title: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context2,
                    // ignore: prefer_const_constructors
                    MaterialPageRoute(builder: (context1) => MyApp()),
                  );
                },
                // ignore: prefer_const_constructors
                child: Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context2);
                },
                // ignore: prefer_const_constructors
                child: Text("No")),
          ],
        );
      });
}

// Future operation() async {
//   var connection = PostgreSQLConnection(
//       "192.168.1.78", // hostURL
//       5432, // port
//       "postgres", // databaseName
//       username: "postgres",
//       password: "AdvEnt4pgSQL",
//       useSSL: false);
//   try {
//     await connection.open();
//     if (connection.isClosed == false)
      // await connection.query(
      //     '''INSERT INTO ROLE(ROLE_ID, ROLE_NAME) VALUES(3, 'Interns')''');
      // await connection.query(
      //     '''INSERT INTO department(department_id,department_name) VALUES(3,'Human resource')''');
      // await connection.query(
      //     '''UPDATE department SET department_name = 'Software development' where department_id = 1''');
    // await connection
    //     .query('''DELETE FROM department where department_id = 4''');
//     print("Connected");
//   } catch (e) {
//     print("error");
//     print(e.toString());
//   }
// }



// Future<void> setData(PostgreSQLConnection connection, String table,
  //     Map<String, dynamic> data) async {
  //   await setData(connection, "login", data);
  //   await connection.execute(
  //       "INSERT INTO LOGIN (email, password) VALUES (@email, @password)",
  //       substitutionValues: data);
  // }