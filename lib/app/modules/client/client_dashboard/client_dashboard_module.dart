import 'package:dio/dio.dart';
import 'repositories/client_dashboard_repository.dart';
import 'client_dashboard_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'client_dashboard_page.dart';

class ClientDashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ClientDashboardRepository,
        $ClientDashboardController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ClientDashboardPage()),
      ];

  static Inject get to => Inject<ClientDashboardModule>.of();
}
