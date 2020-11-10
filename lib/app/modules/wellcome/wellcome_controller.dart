import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../shared/auth/repositories/interfaces/auth_repository_interface.dart';

part 'wellcome_controller.g.dart';

@Injectable()
class WellcomeController = _WellcomeControllerBase with _$WellcomeController;

abstract class _WellcomeControllerBase with Store {
  IAuthRepository authRepository;

  _WellcomeControllerBase() {
    authRepository = Modular.get<IAuthRepository>();
  }

  void wellcomeCtrlSignInEmailPassword() {
    Modular.to.pushNamed('/login');
  }

  void wellcomeCtrlSignInGoogle() {
    authRepository.signInGoogle().then((value) {
      if (value.success) {
        Modular.to.pushNamed('/home');
      } else {
        print(value.message);
      }
    });
  }
}
