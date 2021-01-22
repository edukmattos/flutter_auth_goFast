import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../../../models/client_model.dart';

abstract class IClientSearchRepository implements Disposable {
  Future<Snapshot<List<ClientModel>>> searchClientEinSsaName();
}
