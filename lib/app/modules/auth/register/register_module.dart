import 'package:flutter_modular/flutter_modular.dart';

import 'register_controller.dart';
import 'register_page.dart';
import 'repositories/register_repository.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $RegisterRepository,
        $RegisterController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
