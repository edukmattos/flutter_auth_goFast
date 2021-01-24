// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_new_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientNewController on _ClientNewControllerBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ClientNewControllerBase.isFormValid'))
          .value;

  final _$nameAtom = Atom(name: '_ClientNewControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$einSsaAtom = Atom(name: '_ClientNewControllerBase.einSsa');

  @override
  String get einSsa {
    _$einSsaAtom.reportRead();
    return super.einSsa;
  }

  @override
  set einSsa(String value) {
    _$einSsaAtom.reportWrite(value, super.einSsa, () {
      super.einSsa = value;
    });
  }

  final _$emailAtom = Atom(name: '_ClientNewControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$saveAsyncAction = AsyncAction('_ClientNewControllerBase.save');

  @override
  Future<bool> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_ClientNewControllerBaseActionController =
      ActionController(name: '_ClientNewControllerBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_ClientNewControllerBaseActionController.startAction(
        name: '_ClientNewControllerBase.changeName');
    try {
      return super.changeName(value);
    } finally {
      _$_ClientNewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEinSsa(String value) {
    final _$actionInfo = _$_ClientNewControllerBaseActionController.startAction(
        name: '_ClientNewControllerBase.changeEinSsa');
    try {
      return super.changeEinSsa(value);
    } finally {
      _$_ClientNewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_ClientNewControllerBaseActionController.startAction(
        name: '_ClientNewControllerBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_ClientNewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
einSsa: ${einSsa},
email: ${email},
isFormValid: ${isFormValid}
    ''';
  }
}
