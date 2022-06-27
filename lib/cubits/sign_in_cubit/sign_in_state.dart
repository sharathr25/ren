part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  const SignInState(
      {this.phoneNumber = '',
      this.verificationId = '',
      this.otp = '',
      this.forceResendingToken = 0});

  final String phoneNumber;
  final String verificationId;
  final String otp;
  final int forceResendingToken;

  @override
  List<Object> get props =>
      [phoneNumber, verificationId, otp, forceResendingToken];

  SignInState copyWith({String? phoneNumber, String? password, String? otp}) {
    return SignInState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        otp: otp ?? this.otp,
        verificationId: verificationId,
        forceResendingToken: forceResendingToken);
  }
}

class SignInLoading extends SignInState {
  const SignInLoading(verificationId, forceResendingToken, phoneNumber)
      : super(
          verificationId: verificationId,
          forceResendingToken: forceResendingToken,
          phoneNumber: phoneNumber,
        );
}

class SignInDone extends SignInState {}

class SignInCodeSent extends SignInState {
  const SignInCodeSent(verificationId, forceResendingToken, phoneNumber)
      : super(
          verificationId: verificationId,
          forceResendingToken: forceResendingToken,
          phoneNumber: phoneNumber,
        );
}

class SignInError extends SignInState {
  const SignInError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
