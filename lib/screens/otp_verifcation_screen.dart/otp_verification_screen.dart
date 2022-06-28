import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ren/components/Heading.dart';
import 'package:ren/constants/constants.dart';
import 'package:ren/routes/routes.gr.dart';
import 'package:ren/cubits/sign_in_cubit/sign_in_cubit.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    final StackRouter router = context.router;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: Container(
            margin: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(children: [
                const Heading(
                  text: "OTP Verification",
                ),
                BlocListener<SignInCubit, SignInState>(
                  listener: ((context, state) => {
                        if (state is SignInDone)
                          router.replaceAll([
                            const MainHomeRoute(),
                          ])
                        else if (state is SignInError)
                          print(state.errorMessage)
                      }),
                  child: SignInForm(router: router),
                )
              ]),
            ),
          )),
    );
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
                maxLength: 6,
                decoration: const InputDecoration(
                  label: Text("OTP"),
                ),
                onSaved: (value) {
                  context.read<SignInCubit>().otpSaved(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return "OTP is required";
                  _formKey.currentState!.save();
                },
              ),
              const SizedBox(height: gapBetweenFormElements),
              ElevatedButton(
                  onPressed: () async {
                    if (state is SignInLoading) return;
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<SignInCubit>().verifyOtpCode();
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
                  const Text("Didn't receieved a code?"),
                  TextButton(
                      onPressed: () {
                        if (state is SignInLoading) return;
                        context
                            .read<SignInCubit>()
                            .loginWithPhoneNumber(resend: true);
                      },
                      child: const Text("RESEND"))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
