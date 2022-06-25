import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ren/routes/routes.gr.dart';
import 'package:ren/utils/validators.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key, required this.onLoginCallback})
      : super(key: key);

  final Function(bool loggedIn) onLoginCallback;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String emailOrPhoneNumber = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    AutoRouter.of(context);
    final StackRouter router = context.router;

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
                ?.merge(TextStyle(color: primaryColor)),
          ),
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Email or Phone number*"),
                    ),
                    onSaved: (value) {
                      emailOrPhoneNumber = value!;
                    },
                    validator: emailOrPhoneNumberValidator(_formKey),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      label: Text("Password*"),
                    ),
                    onSaved: (value) {
                      password = value!;
                    },
                    validator: passwordValidator(_formKey),
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // TODO: Firebase login or fire bloc event for firebase login
                      }
                    },
                    child: const Text("SIGN IN"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            router.push(SignUpRoute(onLoginCallback: (_) {}));
                          },
                          child: const Text("SIGN UP"))
                    ],
                  )
                ],
              ))
        ]),
      ),
    ));
  }
}
