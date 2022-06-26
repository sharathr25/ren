import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ren/repos/auth_repository/auth_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void firstNameSaved(String value) {
    emit(state.copyWith(firstName: value));
  }

  void lastNameSaved(String value) {
    emit(state.copyWith(lastName: value));
  }

  void passwordSaved(String value) {
    emit(state.copyWith(password: value));
  }

  void phoneNumberSaved(String value) {
    emit(state.copyWith(phoneNumber: value));
  }

  Future<void> signUp() async {
    try {
      String phoneNumber = state.phoneNumber;
      String password = state.password;
      String firstName = state.firstName;
      String lastName = state.lastName;
      emit(SignUpLoading());
      // sign up phone number as fake email to allow phone number and password combo sign in
      await _authenticationRepository.signUp(
        email: '$phoneNumber@ren.com',
        password: password,
      );
      // print(firstName);
      // print(lastName);
      // print(_authenticationRepository.currentUser.fireBaseUserId);
      // TODO: Save id and names in mongodb or somewhere
      // THINK: what happens if the saving fails
      emit(SignUpDone());
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(SignUpError(e.message));
    } catch (_) {
      emit(const SignUpError("Sign up failed, Try again"));
    }
  }
}
