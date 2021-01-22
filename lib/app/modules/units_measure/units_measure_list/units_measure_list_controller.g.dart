// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units_measure_list_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $UnitsMeasureListController = BindInject(
  (i) => UnitsMeasureListController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UnitsMeasureListController on _UnitsMeasureListControllerBase, Store {
  final _$valueAtom = Atom(name: '_UnitsMeasureListControllerBase.value');

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

  final _$_UnitsMeasureListControllerBaseActionController =
      ActionController(name: '_UnitsMeasureListControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_UnitsMeasureListControllerBaseActionController
        .startAction(name: '_UnitsMeasureListControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_UnitsMeasureListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
