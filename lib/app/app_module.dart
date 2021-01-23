import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/interfaces/shared_repository_interface.dart';
import 'core/repositories/shared_repository.dart';
import 'modules/auth/login/login_module.dart';
import 'modules/auth/register/register_module.dart';
import 'modules/client/client_list/client_list_module.dart';
import 'modules/client/client_search/client_search_module.dart';
import 'modules/dashboard/dashboard_module.dart';
import 'modules/shared/auth/repositories/auth_repository.dart';
import 'modules/shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'modules/splash/splash_module.dart';
import 'modules/start/pages/welcome/welcome_controller.dart';
import 'modules/start/start_module.dart';

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
        $WelcomeController,
        //$ContactController,
        //$AboutController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashModule()),
        ModularRouter("/", module: SplashModule()),
        ModularRouter("/start", module: StartModule()),
        //ModularRouter("/home", module: HomeModule()),
        ModularRouter("/login", module: LoginModule()),
        ModularRouter("/register", module: RegisterModule()),
        ModularRouter("/dashboard", module: DashboardModule()),
        ModularRouter("/clients/list", module: ClientListModule()),
        ModularRouter("/clients/search", module: ClientSearchModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
