import 'package:mobx/mobx.dart';
import '../../../models/client_model.dart';
import 'repositories/client_list_repository.dart';

part 'client_list_controller.g.dart';

class ClientListController = _ClientListControllerBase
    with _$ClientListController;

abstract class _ClientListControllerBase with Store {
  final ClientListRepository _clientListRepository;

  _ClientListControllerBase(this._clientListRepository) {
    clientsAll();
  }

  @action
  // ignore: type_annotate_public_apis
  Future clientsAll() async {
    // ignore: lines_longer_than_80_chars
    return clients =
        ObservableStream(await _clientListRepository.getClientAll());
  }

  @observable
  ObservableStream<List<ClientModel>> clients;
}
