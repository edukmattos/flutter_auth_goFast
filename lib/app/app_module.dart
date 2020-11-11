import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/interfaces/shared_repository_interface.dart';
import 'core/repositories/shared_repository.dart';
import 'modules/auth/login/login_module.dart';
import 'modules/home/home_module.dart';
import 'modules/shared/auth/repositories/auth_repository.dart';
import 'modules/shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'modules/splash/splash_module.dart';
import 'modules/welcome/welcome_controller.dart';
import 'modules/welcome/welcome_module.dart';

class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  List<Bind> get binds => [
        Bind<ISharesRepositoryInterface>(
          (i) => SharedRepository(),
        ),
        Bind<IAuthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),
        $AppController,
        //$SplashController,
        $WelcomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashModule()),
        ModularRouter("/welcome", module: WelcomeModule()),
        ModularRouter("/home", module: HomeModule()),
        ModularRouter("/login", module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
