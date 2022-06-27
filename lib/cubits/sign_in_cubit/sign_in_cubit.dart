import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ren/repos/auth_repository/auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._authenticationRepository) : super(const SignInState());

  final AuthenticationRepository _authenticationRepository;

  void phoneNumberSaved(String value) {
    emit(state.copyWith(phoneNumber: value));
  }

  void otpSaved(String value) {
    emit(state.copyWith(otp: value));
  }

  Future<void> loginWithPhoneNumber({bool? resend = false}) async {
    try {
      String phoneNumber = state.phoneNumber;
      emit(SignInLoading(
          state.verificationId, state.forceResendingToken, state.phoneNumber));
      await _authenticationRepository.signInWithPhoneNumber(
          phoneNumber: '+91$phoneNumber',
          forceResendingToken:
              resend != null && resend ? state.forceResendingToken : null,
          codeSent: (String verificationId, int? forceResendingToken) {
            emit(SignInCodeSent(
                verificationId, forceResendingToken, phoneNumber));
          });
    } on VerifyPhoneNumberFailure catch (e) {
      emit(SignInError(e.message));
    } catch (e) {
      emit(const SignInError("Sign in failed, Try again"));
    }
  }

  Future<void> verifyOtpCode() async {
    try {
      String otp = state.otp;
      String verificationId = state.verificationId;
      emit(SignInLoading(
          state.verificationId, state.forceResendingToken, state.phoneNumber));
      await _authenticationRepository.verifyOtpCode(
        otp: otp,
        verificationId: verificationId,
      );
      emit(SignInDone());
    } on VerifyOTPFailure catch (e) {
      emit(SignInError(e.message));
    } catch (e) {
      emit(const SignInError("OTP verification failed, Try again"));
    }
  }
}
