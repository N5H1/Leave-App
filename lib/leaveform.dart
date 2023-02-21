import 'package:flutter/material.dart';
import 'package:flutter_leave/dashboard.dart';
import 'package:flutter_leave/services/pgadmin.dart';
import 'package:intl/intl.dart';

class hereL extends StatefulWidget {
  @override
  State<hereL> createState() => _hereLState();
}

class _hereLState extends State<hereL> {
  TextEditingController dtfrom = TextEditingController();
  TextEditingController dtto = TextEditingController();
  TextEditingController nod = TextEditingController();
  TextEditingController rsn = TextEditingController();
  TextEditingController cnn = TextEditingController();
  TextEditingController cnp = TextEditingController();
  final fk3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leave application"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fk3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 13.0, top: 8.0, bottom: 8.0, right: 13.0),
                child: SizedBox(
                  height: 70,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter date.";
                      } else
                        null;
                    },
                    controller: dtfrom,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'From',
                        hintText: "From this date",
                        suffix: IconButton(
                          icon: Icon(Icons.calendar_month_sharp),
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2123));
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              Colors.black;
                              setState(() {
                                dtfrom.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected.");
                            }
                          },
                        )),
                    readOnly: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 13.0, top: 8.0, bottom: 8.0, right: 13.0),
                child: SizedBox(
                  height: 70,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Select date.";
                      } else
                        null;
                    },
                    controller: dtto,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'To',
                        hintText: "Till this date",
                        suffix: IconButton(
                          icon: Icon(Icons.calendar_month_sharp),
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2123));
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              Colors.black;
                              setState(() {
                                dtto.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected.");
                            }
                          },
                        )),
                    readOnly: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 13.0, top: 8.0, bottom: 8.0, right: 13.0),
                child: SizedBox(
                  height: 70,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter total no. of days.";
                      } else
                        null;
                    },
                    controller: nod,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number of days',
                        hintText: "Total days",
                        suffixIcon: Icon(
                          (Icons.calculate_sharp),
                        )),
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true, signed: false),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 13.0, top: 8.0, bottom: 8.0, right: 13.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter reason for leave.";
                    } else
                      null;
                  },
                  controller: rsn,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Reason',
                      hintText: "Mention appropriate reason",
                      suffixIcon: Icon(
                        (Icons.edit_sharp),
                      )),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0, top: 13.0, right: 13.0, left: 13.0),
                child: Row(
                  children: [
                    Text(
                      "Contact during leave:",
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 13.0, bottom: 8.0, right: 13.0),
                child: SizedBox(
                  height: 70,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter contact name.";
                      } else
                        null;
                    },
                    controller: cnn,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contact Name',
                        // hintText: "",
                        suffixIcon: Icon(
                          (Icons.hail_sharp),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 13.0, top: 8.0, bottom: 8.0, right: 13.0),
                child: SizedBox(
                  height: 70,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter contact number.";
                      } else
                        null;
                    },
                    controller: cnp,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contact Number',
                        // hintText: "",
                        suffixIcon: Icon(
                          (Icons.phone_sharp),
                        )),
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              ElevatedButton(
                child: const Text('Submit', style: TextStyle(fontSize: 17)),
                onPressed: () {
                  if (fk3.currentState!.validate()) {
                    sboperation(dtfrom.text, dtto.text, nod.text, rsn.text,
                        cnn.text, cnp.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => hereD()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
