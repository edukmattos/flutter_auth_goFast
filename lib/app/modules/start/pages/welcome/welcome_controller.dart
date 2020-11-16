import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../app_controller.dart';
import '../../../shared/auth/repositories/interfaces/auth_repository_interface.dart';

part 'welcome_controller.g.dart';

@Injectable()
class WelcomeController = _WelcomeControllerBase with _$WelcomeController;

abstract class _WelcomeControllerBase with Store implements Disposable {
  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
  }

  final AppController appController;

  IAuthRepository authRepository;

  _WelcomeControllerBase(this.appController) {
    authRepository = Modular.get<IAuthRepository>();
  }

  void welcomeCtrlSignInEmailPassword() {
    Modular.to.pushNamed('/login');
  }

  void welcomeCtrlSignInGoogle() {
    authRepository.signInGoogle().then((value) {
      if (value.success) {
        Modular.to.pushNamed('/home');
      } else {
        print(value.message);
      }
    });
  }
}
