import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../../models/client_model.dart';
import '../../documents/clients_document.dart';
import 'interfaces/client_search_repository_interface.dart';

part 'client_search_repository.g.dart';

@Injectable()
class ClientSearchRepository implements IClientSearchRepository {
  final HasuraConnect _hasuraConnect;

  ClientSearchRepository(this._hasuraConnect);

  Future<Snapshot<List<ClientModel>>> searchClientEinSsaName() async {
    var query = docClientAll;
    print("2222");
    //subscription
    var snapshot = await _hasuraConnect.subscription(query);

    print(await snapshot);

    return snapshot.map((data) {
      if (data == null) {
        return null;
      }
      return ClientModel.fromJsonList(data["data"]["clients"]);
    });

    ///subscription
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
