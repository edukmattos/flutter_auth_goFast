import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../../app_controller.dart';
import '../../../models/client_model.dart';
import 'repositories/client_search_repository.dart';

part 'client_search_controller.g.dart';

@Injectable()
class ClientSearchController = _ClientSearchControllerBase
    with _$ClientSearchController;

abstract class _ClientSearchControllerBase with Store {
  final ClientSearchRepository _clientSearchRepository;
  final AppController appController;

  _ClientSearchControllerBase(
      this._clientSearchRepository, this.appController) {
    searchClients();
  }

  @observable
  ObservableMap<String, dynamic> clientsFiltersOptions = ObservableMap();

  @action
  // ignore: lines_longer_than_80_chars
  // ignore: type_annotate_public_apis
  changeClientsFiltersOptions(Map<String, dynamic> value) =>
      clientsFiltersOptions = value;

  @observable
  String clientsFilterTags;

  @action
  // ignore: type_annotate_public_apis
  changeClientsFilterTags(String value) => clientsFilterTags = value;

  @computed
  bool get isFormValid {
    //print(validateClientsFilter());
    //return true;
    // ignore: lines_longer_than_80_chars
    //return validateClientsFiltersOptions() == null;
    return validateClientsFiltersOptions() == null &&
        validateClientsFilterTag() == null;
  }

  String validateClientsFiltersOptions() {
    print(clientsFiltersOptions);
    if (validatorRequired(clientsFiltersOptions)) return "Obrigatorio.";
    return null;
  }

  String validateClientsFilterTag() {
    if (validatorRequired(clientsFilterTags)) return "Obrigatorio.";
    return null;
  }

  @action
  // ignore: type_annotate_public_apis
  Future searchClients() async {
    // ignore: lines_longer_than_80_chars
    return clients =
        // ignore: lines_longer_than_80_chars
        ObservableStream(
            await _clientSearchRepository.searchClientEinSsaName());
  }

  @observable
  ObservableStream<List<ClientModel>> clients;
}
