import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/errors/auth_sign_in_error_interceptor.dart';
import '../../../../core/errors/auth_sign_up_error_interceptor.dart';
import '../../../../core/features/responses/response_builder.dart';
import '../../../../core/features/responses/response_default.dart';
import 'interfaces/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<User>(
        object: firebaseAuth.currentUser,
      );
    } on Exception catch (e) {
      return ResponseBuilder.failed(
        object: e,
        message: e.toString(),
      );
    }
  }

  @override
  Future<DefaultResponse> signInEmailPassword(
      {String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return ResponseBuilder.success<User>(
        object: firebaseAuth.currentUser,
      );
    } on Exception catch (e) {
      return ResponseBuilder.failed(
        object: e,
        message: e.toString(),
        errorInterceptor: AuthSignInErrorInterceptor(),
      );
    }
  }

  @override
  Future<DefaultResponse> signInGoogle() async {
    try {
      final _auth = FirebaseAuth.instance;
      final googleSignIn = GoogleSignIn();

      final googleSignInAccount = await googleSignIn.signIn();
      // ignore: lines_longer_than_80_chars
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final authResult = await _auth.signInWithCredential(credential);
      final user = authResult.user;

      return ResponseBuilder.success<User>(
        object: firebaseAuth.currentUser,
        message: "Logado com sucesso !",
      );
      // ignore: avoid_catches_without_on_clauses
    } on FirebaseAuthException catch (e) {
      return ResponseBuilder.failed(
        object: e,
        message: e.code,
        errorInterceptor: AuthSignInErrorInterceptor(),
      );
    }
  }

  @override
  Future<DefaultResponse> signOut() async {
    try {
      return ResponseBuilder.success<void>(object: firebaseAuth.signOut());
    } on Exception catch (e) {
      return ResponseBuilder.failed(
        object: e,
        message: e.toString(),
      );
    }
  }

  @override
  Future<DefaultResponse> signUpEmailPassword(
      {String email, String password}) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((user) {
        return ResponseBuilder.success<User>(
          object: firebaseAuth.currentUser,
        );
      });
    } on Exception catch (e) {
      return ResponseBuilder.failed(
        object: e,
        message: e.toString(),
        errorInterceptor: AuthSignUpErrorInterceptor(),
      );
    }
  }
}
