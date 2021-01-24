import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../app_controller.dart';
import '../../../core/config/app_hasura.dart';
import 'client_new_controller.dart';
import 'client_new_page.dart';
import 'repositories/client_new_repository.dart';
import 'repositories/interfaces/client_new_repository_interface.dart';

class ClientNewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // ignore: lines_longer_than_80_chars
        Bind<IClientNewRepository>(
            (i) => ClientNewRepository(i.get<HasuraConnect>())),
        // ignore: lines_longer_than_80_chars
        Bind((i) => ClientNewController(
            i.get<IClientNewRepository>(), i.get<AppController>())),
        Bind((i) => HasuraConnect(configAppHasuraUrl)),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ClientNewPage()),
      ];

  static Inject get to => Inject<ClientNewModule>.of();
}
