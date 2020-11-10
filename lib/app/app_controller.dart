import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'core/features/themes/app_theme_dark.dart';
import 'core/features/themes/app_theme_light.dart';
import 'core/interfaces/app_theme_interface.dart';
import 'core/interfaces/shared_repository_interface.dart';
import 'core/repositories/shared_repository.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  SharedRepository sharedRepository = Modular.get<ISharesRepositoryInterface>();
  _AppControllerBase() {
    appCtrlThemeLoad();
  }

  @observable
  IAppThemeInterface appThemeInterface = AppThemeLight();

  @computed
  bool get isDark =>
      appThemeInterface.getThemeData().brightness == Brightness.dark;

  @action
  void appCtrlThemeSwitch() {
    //print(ThemeData().brightness == Brightness.dark);
    if (isDark) {
      appThemeInterface = AppThemeLight();
    } else {
      appThemeInterface = AppThemeDark();
    }
    appCtrlThemeSavePref();
  }

  void appCtrlThemeSavePref() async {
    //print(isDark);
    await sharedRepository.setValue<bool>('isDark', isDark);
  }

  Future<void> appCtrlThemeLoad() async {
    await sharedRepository.getValue<bool>('isDark').then(
      (value) {
        //print(value);
        value == true
            ? appThemeInterface = AppThemeDark()
            : appThemeInterface = AppThemeLight();
      },
    );
  }
}
