import 'package:flutter_leave/common.dart';
import 'package:postgres/postgres.dart';

Future operation(email, pswd) async {
  AppCommon.connection = PostgreSQLConnection(
      "192.168.1.78", // hostURL
      5432, // port
      "postgres", // databaseName
      username: "postgres",
      password: "AdvEnt4pgSQL",
      useSSL: false);

  await AppCommon.connection.open();
  final data = <String, dynamic>{
    "email": email,
    "password": pswd,
  };

  if (AppCommon.connection.isClosed == false) print("Connected");

  await AppCommon.connection.execute(
      "INSERT INTO LOGIN (email, pwd) VALUES (@email, @password)",
      substitutionValues: data);
}

Future rgoperation(firstName, lastName, emailId, phoneNumber, password) async {
  AppCommon.connection = PostgreSQLConnection(
      "192.168.1.78", // hostURL
      5432, // port
      "postgres", // databaseName
      username: "postgres",
      password: "AdvEnt4pgSQL",
      useSSL: false);

  await AppCommon.connection.open();
  final data = <String, dynamic>{
    "first_name": firstName,
    "last_name": lastName,
    "email_id": emailId,
    "phone_number": phoneNumber,
    "password": password
  };

  if (AppCommon.connection.isClosed == false) print("Connected");

  await AppCommon.connection.execute(
      "INSERT INTO sign_up (first_name, last_name, email_id, phone_number, password) VALUES (@first_name, @last_name, @email_id, @phone_number, @password)",
      substitutionValues: data);
}

Future sboperation(
    fromDate, toDate, numOfDays, reason, contactNameDl, contactNumDl) async {
  AppCommon.connection = PostgreSQLConnection(
      "192.168.1.78", // hostURL
      5432, // port
      "postgres", // databaseName
      username: "postgres",
      password: "AdvEnt4pgSQL",
      useSSL: false);

  await AppCommon.connection.open();
  final data = <String, dynamic>{
    "from_date": fromDate,
    "to_date": toDate,
    "num_of_days": numOfDays,
    "reason": reason,
    "contact_name_dl": contactNameDl,
    "contact_num_dl": contactNumDl,
  };

  if (AppCommon.connection.isClosed == false) print("Connected");

  await AppCommon.connection.execute(
      "INSERT INTO LEAVEFORM (from_date, to_date, num_of_days, reason, contact_name_dl, contact_num_dl) VALUES (@from_date, @to_date, @num_of_days, @reason, @contact_name_dl, @contact_num_dl)",
      substitutionValues: data);
}
