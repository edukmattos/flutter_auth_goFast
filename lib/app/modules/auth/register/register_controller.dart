import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../../app_controller.dart';
import '../../shared/auth/repositories/interfaces/auth_repository_interface.dart';

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  IAuthRepository authRepository;

  final AppController appController;

  _RegisterControllerBase(this.appController) {
    authRepository = Modular.get<IAuthRepository>();
  }

  @observable
  bool loading = false;

  @observable
  String email = "";

  @action
  // ignore: type_annotate_public_apis
  changeEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  // ignore: type_annotate_public_apis
  changePassword(String value) => password = value;

  @observable
  String passwordConfirm = "";

  @action
  // ignore: type_annotate_public_apis
  changePasswordConfirm(String value) => passwordConfirm = value;

  @computed
  bool get isFormValid {
    return validateEmail() == null &&
        validatePassword() == null &&
        validatePasswordConfirm() == null;
  }

  String validateEmail() {
    // ignore: lines_longer_than_80_chars
    if (validatorRequired(email)) {
      return "Obrigatorio.";
    }
    if (validatorEmail(email)) return "Inválido.";
    return null;
  }

  String validatePassword() {
    if (validatorRequired(password)) return "Obrigatorio.";
    return null;
  }

  String validatePasswordConfirm() {
    if (validatorRequired(passwordConfirm)) return "Obrigatorio.";
    if (password != passwordConfirm) return "Senhas diferentes.";
    return null;
  }

  @action
  Future<void> registerCtrlSignUp({
    @required String email,
    @required String password,
  }) async {
    await authRepository
        .signUpEmailPassword(
      email: email.trim(),
      password: password.trim(),
    )
        .then((response) {
      if (response.success) {
        Modular.to.pushNamed('/dashboard');
      } else {
        throw response;
      }
    });
  }
}
