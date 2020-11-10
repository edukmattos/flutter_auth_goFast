// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AppController = BindInject(
  (i) => AppController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<bool> _$isDarkComputed;

  @override
  bool get isDark => (_$isDarkComputed ??=
          Computed<bool>(() => super.isDark, name: '_AppControllerBase.isDark'))
      .value;

  final _$appThemeInterfaceAtom =
      Atom(name: '_AppControllerBase.appThemeInterface');

  @override
  IAppThemeInterface get appThemeInterface {
    _$appThemeInterfaceAtom.reportRead();
    return super.appThemeInterface;
  }

  @override
  set appThemeInterface(IAppThemeInterface value) {
    _$appThemeInterfaceAtom.reportWrite(value, super.appThemeInterface, () {
      super.appThemeInterface = value;
    });
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  void appCtrlThemeSwitch() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.appCtrlThemeSwitch');
    try {
      return super.appCtrlThemeSwitch();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appThemeInterface: ${appThemeInterface},
isDark: ${isDark}
    ''';
  }
}
