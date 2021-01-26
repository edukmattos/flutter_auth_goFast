import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_controller.dart';
import 'client_dashboard_controller.dart';
import 'client_dashboard_page.dart';

class ClientDashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ClientDashboardController(i.get<AppController>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ClientDashboardPage()),
      ];

  static Inject get to => Inject<ClientDashboardModule>.of();
}
