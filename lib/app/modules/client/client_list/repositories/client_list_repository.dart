import 'package:hasura_connect/hasura_connect.dart';

import '../../../../models/client_model.dart';
import '../../documents/clients_document.dart';
import 'interfaces/client_list_repository_interface.dart';

class ClientListRepository implements IClientListRepository {
  final HasuraConnect _hasuraConnect;

  ClientListRepository(this._hasuraConnect);

  Future<Snapshot<List<ClientModel>>> getClientAll() async {
    var query = docClientAll;

    //print(docClientAll);

    //query
    //var snapshot = await _hasuraConnect.query(query);
    //return ClientModel.fromJsonList(snapshot["data"]["clients"] as List);
    //query

    //subscription
    var snapshot = await _hasuraConnect.subscription(query);

    print(await snapshot);

    return snapshot.map((data) {
      if (data == null) {
        return null;
      }
      return ClientModel.fromJsonList(data["data"]["clients"]);
    });

    //subscription
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
