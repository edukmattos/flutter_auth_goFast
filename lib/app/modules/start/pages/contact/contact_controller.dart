import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'contact_controller.g.dart';

@Injectable()
class ContactController = _ContactControllerBase with _$ContactController;

abstract class _ContactControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
