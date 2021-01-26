import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:mobx/mobx.dart';

import '../../../models/client_model.dart';
import 'repositories/client_search_repository.dart';

part 'client_search_controller.g.dart';

@Injectable()
class ClientSearchController = _ClientSearchControllerBase
    with _$ClientSearchController;

abstract class _ClientSearchControllerBase with Store {
  final ClientSearchRepository _clientSearchRepository;

  _ClientSearchControllerBase(this._clientSearchRepository) {
    searchClients();
  }

  @observable
  String clientsFilter;

  @action
  // ignore: type_annotate_public_apis
  changeClientsFilter(String value) => clientsFilter = value;

  @observable
  List<String> clientsTags;

  @action
  // ignore: type_annotate_public_apis
  changeClientsTags(String value) => clientsTags = value as List<String>;

  @computed
  bool get isFormValid {
    print(validateClientsFilter());
    //return true;
    // ignore: lines_longer_than_80_chars
    //return validateClientsFilter() == null;
    return validateClientsFilter() == null && validateClientsTags() == null;
  }

  String validateClientsFilter() {
    if (validatorRequired(clientsFilter)) return "Obrigatorio.";
    return null;
  }

  String validateClientsTags() {
    if (validatorRequired(clientsTags)) return "Obrigatorio.";
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
