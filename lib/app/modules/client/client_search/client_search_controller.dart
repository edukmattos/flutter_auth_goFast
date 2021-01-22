import 'package:flutter_modular/flutter_modular.dart';
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
