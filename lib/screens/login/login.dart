import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth-provider.dart';
import '../../router/routes-name.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
          color: Colors.grey[300],
          margin: EdgeInsets.only(left: 400,right: 400,top: 50,bottom: 50),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(50)),
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(50)),
                ),
              ),
              OutlinedButton(
                  onPressed: () {

                    context.read<AuthProvider>().login(emailController.text,passwordController.text, context);
                  },
                  child: Text("LOGIN")),


              OutlinedButton(
                  onPressed: () {

                    Navigator.of(context).pushNamed(RoutesName.REGISTER_URL);
                  },
                  child: Text("REGISTER")),
            ],
          ),
        ));
  }
}
