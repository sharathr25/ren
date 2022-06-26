part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState({this.phoneNumber = '', this.password = ''});

  final String phoneNumber;
  final String password;

  @override
  List<Object> get props => [phoneNumber, password];

  SignInState copyWith({String? phoneNumber, String? password}) {
    return SignInState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password);
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
