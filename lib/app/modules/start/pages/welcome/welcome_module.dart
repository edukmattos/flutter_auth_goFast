import 'package:flutter_modular/flutter_modular.dart';

import 'repositories/welcome_repository.dart';
import 'welcome_controller.dart';
import 'welcome_page.dart';

class WelcomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $WelcomeRepository,
        $WelcomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => WelcomePage()),
      ];

  static Inject get to => Inject<WelcomeModule>.of();
}
