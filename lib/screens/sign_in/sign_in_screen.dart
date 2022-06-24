import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key, required this.onLoginCallback})
      : super(key: key);

  final Function(bool loggedIn) onLoginCallback;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(children: [
          Text(
            'Welcome to REN',
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.merge(TextStyle(color: Theme.of(context).primaryColor)),
          ),
        ]),
      ),
    ));
  }
}
