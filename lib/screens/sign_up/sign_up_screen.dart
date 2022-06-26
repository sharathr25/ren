import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ren/components/Heading.dart';
import 'package:ren/constants/constants.dart';
import 'package:ren/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ren/repos/auth_repository/auth_repository.dart';
import 'package:ren/routes/routes.gr.dart';
import 'package:ren/utils/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    final StackRouter router = context.router;

    return BlocProvider(
      create: (context) =>
          SignUpCubit(RepositoryProvider.of<AuthenticationRepository>(context)),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Heading(text: "Create account"),
                  BlocListener<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpDone) {
                        router.removeLast();
                        router.replace(const MainHomeRoute());
                      } else if (state is SignUpError) {
                        print(state.errorMessage);
                      }
                    },
                    child: SignUpForm(router: router),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    required this.router,
  }) : super(key: key);

  final StackRouter router;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _pass = TextEditingController();

    return BlocSelector<SignUpCubit, SignUpState, dynamic>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        final signUpCubit = context.read<SignUpCubit>();
        return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: gapBetweenFormElements),
                TextFormField(
                  validator: requiredValidator(_formKey, "First name required"),
                  onSaved: (value) => signUpCubit.firstNameSaved(value!),
                  decoration: const InputDecoration(
                    label: Text("First name"),
                  ),
                ),
                const SizedBox(height: gapBetweenFormElements),
                TextFormField(
                  validator: requiredValidator(_formKey, "Last name required"),
                  onSaved: (value) => signUpCubit.lastNameSaved(value!),
                  decoration: const InputDecoration(
                    label: Text("Last name"),
                  ),
                ),
                const SizedBox(height: gapBetweenFormElements),
                TextFormField(
                  validator: phoneNumberValidator(_formKey),
                  onSaved: (value) => signUpCubit.phoneNumberSaved(value!),
                  decoration: const InputDecoration(
                    label: Text("Phone number"),
                  ),
                ),
                const SizedBox(height: gapBetweenFormElements),
                TextFormField(
                  onChanged: (value) => signUpCubit.passwordSaved(value),
                  validator: passwordValidator(_formKey),
                  controller: _pass,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                  ),
                ),
                const SizedBox(height: gapBetweenFormElements),
                TextFormField(
                  validator: confirmPasswordValidator(_formKey, state.password),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    label: Text("Confirm password"),
                  ),
                ),
                const SizedBox(height: gapBetweenFormElements),
                ElevatedButton(
                  onPressed: () async {
                    if (state is SignUpLoading) return;
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      signUpCubit.signUp();
                    }
                  },
                  child: state is SignUpLoading
                      ? const SizedBox(
                          width: loadingIndicatorSize,
                          height: loadingIndicatorSize,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1,
                          ),
                        )
                      : const Text("SIGN UP"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          if (state is SignUpLoading) return;
                          router.push(const SignInRoute());
                        },
                        child: const Text("SIGN IN"))
                  ],
                )
              ],
            ));
      },
    );
  }
}
