import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ren/repos/auth_repository/auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._authenticationRepository) : super(const SignInState());

  final AuthenticationRepository _authenticationRepository;

  void emailSaved(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordSaved(String value) {
    emit(state.copyWith(password: value));
  }

  Future<void> loginWithEmail() async {
    try {
      String email = state.email;
      String password = state.password;
      emit(SignInLoading());
      await _authenticationRepository.logInWithEmailAndPassword(
        email: email,
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
