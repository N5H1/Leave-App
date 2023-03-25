import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_leave/main.dart';
import 'package:flutter_leave/services/pgadmin.dart';

class hereS extends StatefulWidget {
  const hereS({super.key});

  @override
  State<hereS> createState() => _hereSState();
}

class _hereSState extends State<hereS> {
  final fn = TextEditingController();
  final ln = TextEditingController();
  final ml = TextEditingController();
  final ph = TextEditingController();
  final cp = TextEditingController();
  final rp = TextEditingController();
  final fk2 = GlobalKey<FormState>();
  bool obscureTextPc = true;
  bool obscureTextPr = true;

  @override
  void initState() {
    obscureTextPc = true;
    obscureTextPr = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fk2,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 13.0, bottom: 8.0, left: 13.0, right: 13.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter first name.";
                  } else {
                    null;
                  return null;
                  }
                },
                controller: fn,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name here.',
                  suffixIcon: Icon(Icons.perm_identity_outlined),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 13.0, right: 13.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter last name.";
                  } else {
                    null;
                  return null;
                  }
                },
                controller: ln,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(),
                  hintText: 'Enter your surname here.',
                  suffixIcon: Icon(Icons.perm_identity_sharp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 13.0, right: 13.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter email address.";
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Invalid Email.";
                  } else {
                    null;
                  return null;
                  }
                },
                controller: ml,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    // labelText: AutofillHints.email,
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    hintText: 'Enter email here.',
                    suffixIcon: Icon(Icons.mail_outline_sharp)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 13.0, top: 8.0, bottom: 8.0, right: 13.0),
              child: SizedBox(
                height: 60,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter contact number.";
                    } else {
                      null;
                    return null;
                    }
                  },
                  controller: ph,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact Number',
                      // hintText: "",
                      suffixIcon: Icon(
                        (Icons.phone_sharp),
                      )),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 13.0, right: 13.0),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password creation is necessary.";
                      }
                      if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                        return "Enter valid password.";
                      } else {
                        null;
                      return null;
                      }
                    },
                    controller: cp,
                    obscureText: obscureTextPc,
                    decoration: InputDecoration(
                        // labelText: AutofillHints.password,
                        labelText: "Password",
                        border: const OutlineInputBorder(),
                        hintText: 'Create password.',
                        suffixIcon: IconButton(
                          icon: (obscureTextPc
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                          // color: Theme.of(context).primaryColorDark,
                          onPressed: () {
                            setState(() {
                              obscureTextPc = !obscureTextPc;
                            });
                          },
                        )))),
            Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 13.0, right: 13.0),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Re-enter created password.";
                      }
                      if (value != cp.text) {
                        return "Password doesn't match.";
                      } else {
                        null;
                      return null;
                      }
                    },
                    controller: rp,
                    obscureText: obscureTextPc,
                    decoration: InputDecoration(
                        // labelText: AutofillHints.password,
                        labelText: "Confirm Password",
                        border: const OutlineInputBorder(),
                        hintText: 'Enter password again.',
                        suffixIcon: IconButton(
                          icon: (obscureTextPr
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)),
                          // color: Theme.of(context).primaryColorDark,
                          onPressed: () {
                            setState(() {
                              obscureTextPr = !obscureTextPr;
                            });
                          },
                        )))),
            const SizedBox(
              height: 13,
            ),
            ElevatedButton(
              child: const Text('Register', style: TextStyle(fontSize: 17)),
              onPressed: () {
                if (fk2.currentState!.validate()) {
                  rgoperation(fn.text, ln.text, ml.text, ph.text, rp.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
