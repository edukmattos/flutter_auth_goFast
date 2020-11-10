import 'package:flutter_modular/flutter_modular.dart';

import 'repositories/wellcome_repository.dart';
import 'wellcome_controller.dart';
import 'wellcome_page.dart';

class WellcomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $WellcomeRepository,
        $WellcomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => WellcomePage()),
      ];

  static Inject get to => Inject<WellcomeModule>.of();
}
