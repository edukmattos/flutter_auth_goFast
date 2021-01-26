import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_controller.dart';

part 'client_dashboard_controller.g.dart';

@Injectable()
class ClientDashboardController = _ClientDashboardControllerBase
    with _$ClientDashboardController;

abstract class _ClientDashboardControllerBase with Store {
  final AppController appController;

  _ClientDashboardControllerBase(this.appController);

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
