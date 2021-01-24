import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'interfaces/client_new_repository_interface.dart';

part 'client_new_repository.g.dart';

@Injectable()
class ClientNewRepository implements IClientNewRepository {
  final HasuraConnect _hasuraConnect;
  ClientNewRepository(this._hasuraConnect);

  @override
  Future<bool> save(String einSsa, String name, String email) async {
    var insert = '''
      mutation clientSave(\$einSsa: String, \$name: String, \$email: String) {
        insert_clients(objects: {ein_ssa: \$einSsa, name: \$name, email: \$email}) {
          affected_rows
        }
      }
    ''';
    await _hasuraConnect.mutation(insert,
        variables: {"einSsa": einSsa, "name": name, "email": email});

    //print("return  ${snapshot["data"]["affected_rows"]}");

    //return snapshot["data"]["affected_rows"] > 0;

    return true;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
