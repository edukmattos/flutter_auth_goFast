import '../interfaces/error_interceptor_interface.dart';

class AuthSignInErrorInterceptor implements IErrorInterceptor {
  @override
  String handleError(String error) {
    print(error);
    switch (error) {
      case 'user-not-found':
        //authStatus = AuthStatus.successful;
        return 'Acho que essa senha está muito curta, tente uma maior!';
        break;
      case 'wrong-password':
        return 'Ops! Esse email é inválido!';
        break;
      case 'user-disabled':
        return 'Conta desabilitada, '
            'se já tem uma conta basta fazer o login!';
        break;
      case 'operation-not-allowed':
        return 'Esse email já está cadastrado,'
            'se já tem uma conta basta fazer o login!';
        break;
      case 'invalid-credencial':
        return 'Esse email já está cadastrado,'
            'se já tem uma conta basta fazer o login!';
        break;
      case 'invalid-verification-code':
        return 'Esse email já está cadastrado,'
            'se já tem uma conta basta fazer o login!';
        break;
      case 'invalid-verification-id':
        return 'Esse email já está cadastrado,'
            'se já tem uma conta basta fazer o login!';
        break;
      case 'account-exists-with-different-credencial':
        return 'Esse email já está cadastrado,'
            'se já tem uma conta basta fazer o login!';
        break;

      default:
        return 'Não foi possível realizar o registro, '
            'tente novamente mais tarde.';
    }
  }
}
