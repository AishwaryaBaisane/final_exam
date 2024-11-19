import 'package:final_exam/Screen/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/BookController.dart';
import '../srvices/AuthServices/authServices.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(dependency);
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUpPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                  hintText: 'Email', enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: Colors.black)
              )),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtPassword,
              decoration: InputDecoration(
                  hintText: 'Password', enabledBorder: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Have a Account ??'),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ));
                    },
                    child: Text('Sign In')),
              ],
            ),
            OutlinedButton(
                onPressed: () {
                  String email = txtEmail.text;
                  String password = txtEmail.text;
                  AuthServices.services.createAccount(email, password);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignInPage(),
                  ));
                  txtEmail.clear();
                  txtPassword.clear();
                },
                child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
