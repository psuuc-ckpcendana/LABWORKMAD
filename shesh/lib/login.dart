import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shesh/home.dart';
import 'package:shesh/register.dart';

class LOGINU extends StatefulWidget {
  const LOGINU({super.key});

  @override
  State<LOGINU> createState() => _LOGINUState();
}

class _LOGINUState extends State<LOGINU> {
  final email = TextEditingController();
  final pC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool show = true;
  void toggle() {
    setState(() {
      show = !show;
    });
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: pC.text)
          .then((value) {
        Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (context) => HomeDart(),
        ));
      }).catchError((error) {
        print(error);
        EasyLoading.showError("Incorrect Email or Password");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LogIn"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }
                  if (!EmailValidator.validate(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: pC,
                obscureText: show,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Password",
                    suffixIcon: IconButton(
                        onPressed: toggle, icon: const Icon(Icons.visibility))),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: login, child: const Text("LOGIN")),
              Row(
                children: [
                  const Text("Doesn't have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterU(),
                            ));
                      },
                      child: const Text("Create an account.")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
