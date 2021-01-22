import 'package:dio/dio.dart';
import 'repositories/units_measure_list_repository.dart';
import 'units_measure_list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'units_measure_list_page.dart';

class UnitsMeasureListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $UnitsMeasureListRepository,
        $UnitsMeasureListController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => UnitsMeasureListPage()),
      ];

  static Inject get to => Inject<UnitsMeasureListModule>.of();
}
