import 'package:flutter/material.dart';
import 'package:flutter_leave/common.dart';
import 'package:flutter_leave/form.dart';

import 'leaveform.dart';

class hereD extends StatefulWidget {
  const hereD({super.key});

  @override
  State<hereD> createState() => _hereDState();
}

class _hereDState extends State<hereD> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return (showLoAlert(context));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout_sharp),
              onPressed: () {
                showLoAlert(context);
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Menu",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 28.0),
                        ),
                        Divider(),
                        Divider(
                          height: 0.0,
                          color: Colors.white,
                        ),
                        Divider(),
                        Text("Username",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0)),
                        SizedBox(height: 5.0),
                        Text("Role",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0)),
                        SizedBox(height: 5.0),
                        Text("Department",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0)),
                      ]),
                ),
              ),
              Card(
                elevation: 3.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: const Icon(Icons.home, color: Colors.deepPurple),
                  title: const Text("Home",
                      style: TextStyle(color: Colors.deepPurple)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const hereD()));
                  },
                ),
              ),
              Card(
                elevation: 3.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: const Icon(Icons.note_alt_outlined,
                      color: Colors.deepPurple),
                  title: const Text("Apply for leave",
                      style: TextStyle(color: Colors.deepPurple)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const hereL()));
                  },
                ),
              ),
              Card(
                elevation: 3.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: const Icon(Icons.note_alt_outlined,
                      color: Colors.deepPurple),
                  title: const Text("Show my form",
                      style: TextStyle(color: Colors.deepPurple)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const form()));
                  },
                ),
              ),
              Card(
                elevation: 3.5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading:
                      const Icon(Icons.logout_sharp, color: Colors.deepPurple),
                  title: const Text("Log out",
                      style: TextStyle(color: Colors.deepPurple)),
                  onTap: () {
                    showLoAlert(context);
                  },
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                child: const Text('Apply for leave',
                    style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const hereL()),
                  );
                },
              ),
            ),

            // Center(
            //   child: ElevatedButton(
            //     child: Text("Insert_Role", style: TextStyle(fontSize: 20)),
            //     onPressed: () async {
            //       await DatabaseHelper.instance.insertRecord(
            //           {DatabaseHelper.columnName: "Cleaning & Canteen staff"});
            //     },
            //   ),
            // ),
            // Center(
            //   child: ElevatedButton(
            //     child: Text("Read_Role", style: TextStyle(fontSize: 20)),
            //     onPressed: () async {
            //       var dbread = await DatabaseHelper.instance.queryDatabase();
            //       print(dbread);
            //     },
            //   ),
            // ),
            // Center(
            //   child: ElevatedButton(
            //     child: Text("Update_Role", style: TextStyle(fontSize: 20)),
            //     onPressed: () async {
            //       await DatabaseHelper.instance.updateRecord({
            //         DatabaseHelper.columnId: 5,
            //         DatabaseHelper.columnName: "Cleaning & Canteen staff"
            //       });
            //     },
            //   ),
            // ),
            // Center(
            //   child: ElevatedButton(
            //     child: Text("Remove_Role", style: TextStyle(fontSize: 20)),
            //     onPressed: () async {
            //       await DatabaseHelper.instance.deleteRecord(5);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
