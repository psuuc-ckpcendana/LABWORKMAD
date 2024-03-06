import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shesh/login.dart';

class RegisterU extends StatefulWidget {
  const RegisterU({super.key});

  @override
  State<RegisterU> createState() => _RegisterUState();
}

class _RegisterUState extends State<RegisterU> {
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var pC = TextEditingController();
  bool show = true;
  void toggle() {
    setState(() {
      show = !show;
    });
  }

  void register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email.text, password: pC.text)
        .then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => LOGINU(),
      ));
    }).catchError((error) {
      print(error);
      EasyLoading.showError("Email must have @");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REGISTER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Card(
                child: Text("Create an Account"),
              ),
              const SizedBox(
                height: 15,
              ),
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
              ElevatedButton(
                  onPressed: register, child: const Text("REGISTER")),
              Row(
                children: [
                  const Text("Already have an account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LOGINU(),
                            ));
                      },
                      child: const Text("LOGIN.")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
