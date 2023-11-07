import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginUser({required String email , required String password}) async {

    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage:'user-not-found' ));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errMessage: 'wrong-password'));
      }
      else if (e.code == 'invalid-email') {
        emit(LoginFailure(errMessage: 'invalid-email'));
      }

      else if (e.code == 'invalid-credential') {
        emit(LoginFailure(errMessage: 'invalid-credential'));
      }
      else{
        emit(LoginFailure(errMessage: 'some thing went wrong'));
      }

    } on Exception catch (e) {
      // TODO
      emit(LoginFailure(errMessage: 'some thing went wrong'));
    }
  }

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(RegisterSuccess());

    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'email-already-in-use'));
      }
      else if (e.code == 'invalid-email') {
        emit(RegisterFailure(errMessage: 'invalid-email'));
      }

      else if (e.code == 'invalid-credential') {
        emit(LoginFailure(errMessage: 'invalid-credential'));
      }
      else{
        emit(LoginFailure(errMessage: 'some thing went wrong'));
      }

    } on Exception catch (e) {
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }


}
