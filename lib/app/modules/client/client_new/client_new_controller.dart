import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../../app_controller.dart';
import 'repositories/client_new_repository.dart';

part 'client_new_controller.g.dart';

class ClientNewController = _ClientNewControllerBase with _$ClientNewController;

abstract class _ClientNewControllerBase with Store {
  final ClientNewRepository _clientNewRepository;
  final AppController appController;
  String errorTitle;
  String errorMsg;

  _ClientNewControllerBase(this._clientNewRepository, this.appController);

  @observable
  String name;

  @action
  // ignore: type_annotate_public_apis
  changeName(String value) => name = value;

  @observable
  String einSsa;

  @action
  // ignore: type_annotate_public_apis
  changeEinSsa(String value) => einSsa = value;

  @observable
  String email;

  @action
  // ignore: type_annotate_public_apis
  changeEmail(String value) => email = value;

  @action
  Future<bool> save() async {
    return await _clientNewRepository.save(einSsa, name, email);
  }

  @computed
  bool get isFormValid {
    //return true;
    // ignore: lines_longer_than_80_chars
    return validateEinSsa() == null &&
        validateName() == null &&
        validateEmail() == null;
  }

  String validateEinSsa() {
    if (validatorRequired(einSsa)) return "Obrigatorio.";
    if (einSsa.length >= 0 && einSsa.length <= 11) {
      if (validatorCpf(einSsa)) return "CFP invalido.";
    } else if (einSsa.length >= 12 && einSsa.length <= 14) {
      if (validatorCnpj(einSsa)) return "CNPJ invalido.";
    }
    return null;
  }

  String validateName() {
    if (validatorRequired(name)) return "Obrigatorio.";
    return null;
  }

  String validateEmail() {
    if (validatorRequired(email)) return "Obrigatorio.";
    if (validatorEmail(email)) return "Invalido.";
    return null;
  }
}
