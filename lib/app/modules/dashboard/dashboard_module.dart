import 'package:flutter_modular/flutter_modular.dart';

import 'dashboard_controller.dart';
import 'dashboard_page.dart';
import 'repositories/dashboard_repository.dart';

class DashboardModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $DashboardRepository,
        $DashboardController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => DashboardPage()),
      ];

  static Inject get to => Inject<DashboardModule>.of();
}
