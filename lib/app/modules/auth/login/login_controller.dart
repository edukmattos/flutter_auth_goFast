import 'package:flutter/material.dart';
import 'package:flutter_auth/app/core/features/localization/app_translate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../../app_controller.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AppController appController;

  _LoginControllerBase(this.appController);

  String errorTitle = "";
  String errorMsg = "";

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

  @computed
  bool get isFormValid {
    return validateEmail() == null && validatePassword() == null;
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

  @action
  Future<void> loginCtrlGoogleSignIn() async {}

  @action
  Future<void> loginCtrlEmailPasswordSignIn(
      {@required String email, @required String password}) {}
}
