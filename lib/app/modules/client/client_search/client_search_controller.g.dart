// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_search_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ClientSearchController = BindInject(
  (i) => ClientSearchController(i<ClientSearchRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientSearchController on _ClientSearchControllerBase, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ClientSearchControllerBase.isFormValid'))
          .value;

  final _$clientsFilterAtom =
      Atom(name: '_ClientSearchControllerBase.clientsFilter');

  @override
  String get clientsFilter {
    _$clientsFilterAtom.reportRead();
    return super.clientsFilter;
  }

  @override
  set clientsFilter(String value) {
    _$clientsFilterAtom.reportWrite(value, super.clientsFilter, () {
      super.clientsFilter = value;
    });
  }

  final _$clientsTagsAtom =
      Atom(name: '_ClientSearchControllerBase.clientsTags');

  @override
  List<String> get clientsTags {
    _$clientsTagsAtom.reportRead();
    return super.clientsTags;
  }

  @override
  set clientsTags(List<String> value) {
    _$clientsTagsAtom.reportWrite(value, super.clientsTags, () {
      super.clientsTags = value;
    });
  }

  final _$clientsAtom = Atom(name: '_ClientSearchControllerBase.clients');

  @override
  ObservableStream<List<ClientModel>> get clients {
    _$clientsAtom.reportRead();
    return super.clients;
  }

  @override
  set clients(ObservableStream<List<ClientModel>> value) {
    _$clientsAtom.reportWrite(value, super.clients, () {
      super.clients = value;
    });
  }

  final _$searchClientsAsyncAction =
      AsyncAction('_ClientSearchControllerBase.searchClients');

  @override
  Future<dynamic> searchClients() {
    return _$searchClientsAsyncAction.run(() => super.searchClients());
  }

  final _$_ClientSearchControllerBaseActionController =
      ActionController(name: '_ClientSearchControllerBase');

  @override
  dynamic changeClientsFilter(String value) {
    final _$actionInfo = _$_ClientSearchControllerBaseActionController
        .startAction(name: '_ClientSearchControllerBase.changeClientsFilter');
    try {
      return super.changeClientsFilter(value);
    } finally {
      _$_ClientSearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeClientsTags(String value) {
    final _$actionInfo = _$_ClientSearchControllerBaseActionController
        .startAction(name: '_ClientSearchControllerBase.changeClientsTags');
    try {
      return super.changeClientsTags(value);
    } finally {
      _$_ClientSearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clientsFilter: ${clientsFilter},
clientsTags: ${clientsTags},
clients: ${clients},
isFormValid: ${isFormValid}
    ''';
  }
}
