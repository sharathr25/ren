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

  void passwordSaved(String value) {
    emit(state.copyWith(password: value));
  }

  Future<void> loginWithEmail() async {
    try {
      String phoneNumber = state.phoneNumber;
      String password = state.password;
      emit(SignInLoading());
      await _authenticationRepository.logInWithEmailAndPassword(
        email: '$phoneNumber@ren.com',
        password: password,
      );
      emit(SignInDone());
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(SignInError(e.message));
    } catch (_) {
      emit(const SignInError("Sign in failed, Try again"));
    }
  }
}
