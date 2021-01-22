import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'units_measure_list_controller.g.dart';

@Injectable()
class UnitsMeasureListController = _UnitsMeasureListControllerBase
    with _$UnitsMeasureListController;

abstract class _UnitsMeasureListControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
