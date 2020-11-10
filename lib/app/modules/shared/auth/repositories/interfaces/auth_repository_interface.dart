import '../../../../../core/features/responses/response_default.dart';

abstract class IAuthRepository {
  Future<DefaultResponse> signInGoogle();
  Future<DefaultResponse> signInEmailPassword({String email, String password});
  Future<DefaultResponse> signUpEmailPassword({String email, String password});
  Future<DefaultResponse> signOut();
  Future<DefaultResponse> getUser();
}
