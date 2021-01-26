// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dashboard_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ClientDashboardController = BindInject(
  (i) => ClientDashboardController(i<AppController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientDashboardController on _ClientDashboardControllerBase, Store {
  final _$valueAtom = Atom(name: '_ClientDashboardControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_ClientDashboardControllerBaseActionController =
      ActionController(name: '_ClientDashboardControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ClientDashboardControllerBaseActionController
        .startAction(name: '_ClientDashboardControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ClientDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
