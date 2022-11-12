import 'package:flutter/material.dart';

import '../constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            TextFormField(
              style: TextStyle(
                color: signup_bg,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  color: signup_bg.withOpacity(0.5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defpaultPadding),
              child: TextFormField(
                style: TextStyle(
                  color: signup_bg,
                  fontSize: 14,
                ),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: signup_bg.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/home');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: signup_bg,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(color: login_bg),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: signup_bg),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
