import 'package:flutter_auth/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../core/config/app_hasura.dart';
import 'client_search_controller.dart';
import 'client_search_page.dart';
import 'repositories/client_search_repository.dart';
import 'repositories/interfaces/client_search_repository_interface.dart';

class ClientSearchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // ignore: lines_longer_than_80_chars
        Bind<IClientSearchRepository>(
            (i) => ClientSearchRepository(i.get<HasuraConnect>())),
        Bind((i) => ClientSearchController(
            i.get<IClientSearchRepository>(), i.get<AppController>())),
        Bind((i) => HasuraConnect(configAppHasuraUrl)),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ClientSearchPage()),
      ];

  static Inject get to => Inject<ClientSearchModule>.of();
}
