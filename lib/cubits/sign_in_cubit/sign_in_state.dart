part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState(
      {this.phoneNumber = '',
      this.verificationId = '',
      this.otp = '',
      this.forceResendingToken = 0,
      this.firstName = '',
      this.lastName = ''});

  final String phoneNumber;
  final String verificationId;
  final String otp;
  final int forceResendingToken;
  final String firstName;
  final String lastName;

  @override
  List<Object> get props => [
        phoneNumber,
        verificationId,
        otp,
        forceResendingToken,
        firstName,
        lastName
      ];

  SignInState copyWith({
    String? phoneNumber,
    String? password,
    String? otp,
    String? firstName,
    String? lastName,
  }) {
    return SignInState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otp: otp ?? this.otp,
      verificationId: verificationId,
      forceResendingToken: forceResendingToken,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}

class SignInLoading extends SignInState {
  SignInLoading(SignInState state)
      : super(
          verificationId: state.verificationId,
          forceResendingToken: state.forceResendingToken,
          phoneNumber: state.phoneNumber,
          firstName: state.firstName,
          lastName: state.lastName,
          otp: state.otp,
        );
}

class SignInDone extends SignInState {}

class SignInCodeSent extends SignInState {
  SignInCodeSent(SignInState state, String verificationId)
      : super(
          verificationId: verificationId,
          forceResendingToken: state.forceResendingToken,
          phoneNumber: state.phoneNumber,
          firstName: state.firstName,
          lastName: state.lastName,
        );
}

class SignInError extends SignInState {
  const SignInError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
