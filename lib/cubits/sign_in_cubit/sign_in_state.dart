part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({this.email = '', this.password = ''});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  SignInState copyWith({String? email, String? password}) {
    return SignInState(
        email: email ?? this.email, password: password ?? this.password);
  }
}

class SignInLoading extends SignInState {}

class SignInDone extends SignInState {}

class SignInError extends SignInState {
  const SignInError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
