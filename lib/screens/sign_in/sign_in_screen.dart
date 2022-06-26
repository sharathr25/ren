import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ren/components/Heading.dart';
import 'package:ren/constants/constants.dart';
import 'package:ren/repos/auth_repository/auth_repository.dart';
import 'package:ren/routes/routes.gr.dart';
import 'package:ren/utils/validators.dart';
import 'package:ren/cubits/sign_in_cubit/sign_in_cubit.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    final StackRouter router = context.router;

    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(children: [
          const Heading(
            text: "Welocome to REN",
          ),
          BlocProvider(
            create: (context) => SignInCubit(
                RepositoryProvider.of<AuthenticationRepository>(context)),
            child: BlocListener<SignInCubit, SignInState>(
              listener: ((context, state) => {
                    if (state is SignInDone)
                      router.replace(const MainHomeRoute())
                    else if (state is SignInError)
                      print(state.errorMessage)
                  }),
              child: SignInForm(router: router),
            ),
          )
        ]),
      ),
    ));
  }
}

class SignInForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignInForm({
    Key? key,
    required this.router,
  }) : super(key: key);

  final StackRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignInCubit, SignInState, dynamic>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: gapBetweenFormElements),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Phone number"),
                ),
                onSaved: (value) {
                  context.read<SignInCubit>().phoneNumberSaved(value!);
                },
                validator: phoneNumberValidator(_formKey),
              ),
              const SizedBox(height: gapBetweenFormElements),
              TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  label: Text("Password"),
                ),
                onSaved: (value) {
                  context.read<SignInCubit>().passwordSaved(value!);
                },
                validator: passwordValidator(_formKey),
              ),
              const SizedBox(height: gapBetweenFormElements),
              ElevatedButton(
                  onPressed: () async {
                    if (state is SignInLoading) return;
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<SignInCubit>().loginWithEmail();
                    }
                  },
                  child: state is SignInLoading
                      ? const SizedBox(
                          width: loadingIndicatorSize,
                          height: loadingIndicatorSize,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1,
                          ),
                        )
                      : const Text("SIGN IN")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        if (state is SignInLoading) return;
                        router.push(const SignUpRoute());
                      },
                      child: const Text("SIGN UP"))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
