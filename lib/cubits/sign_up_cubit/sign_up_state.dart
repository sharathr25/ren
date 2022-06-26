part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.password = '',
    this.phoneNumber = '',
    this.firstName = '',
    this.lastName = '',
  });

  final String firstName;
  final String lastName;
  final String password;
  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber, password, firstName, lastName];

  SignUpState copyWith(
      {String? email,
      String? password,
      String? phoneNumber,
      String? firstName,
      String? lastName}) {
    return SignUpState(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber);
  }
}

class SignUpLoading extends SignUpState {}

class SignUpDone extends SignUpState {}

class SignUpError extends SignUpState {
  const SignUpError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
