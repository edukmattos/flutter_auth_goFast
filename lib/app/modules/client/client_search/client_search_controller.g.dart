// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_search_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ClientSearchController = BindInject(
  (i) =>
      ClientSearchController(i<ClientSearchRepository>(), i<AppController>()),
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

  final _$clientsFiltersOptionsAtom =
      Atom(name: '_ClientSearchControllerBase.clientsFiltersOptions');

  @override
  ObservableMap<String, dynamic> get clientsFiltersOptions {
    _$clientsFiltersOptionsAtom.reportRead();
    return super.clientsFiltersOptions;
  }

  @override
  set clientsFiltersOptions(ObservableMap<String, dynamic> value) {
    _$clientsFiltersOptionsAtom.reportWrite(value, super.clientsFiltersOptions,
        () {
      super.clientsFiltersOptions = value;
    });
  }

  final _$clientsFiltersOptionAtom =
      Atom(name: '_ClientSearchControllerBase.clientsFiltersOption');

  @override
  String get clientsFiltersOption {
    _$clientsFiltersOptionAtom.reportRead();
    return super.clientsFiltersOption;
  }

  @override
  set clientsFiltersOption(String value) {
    _$clientsFiltersOptionAtom.reportWrite(value, super.clientsFiltersOption,
        () {
      super.clientsFiltersOption = value;
    });
  }

  final _$clientsFilterTagsAtom =
      Atom(name: '_ClientSearchControllerBase.clientsFilterTags');

  @override
  String get clientsFilterTags {
    _$clientsFilterTagsAtom.reportRead();
    return super.clientsFilterTags;
  }

  @override
  set clientsFilterTags(String value) {
    _$clientsFilterTagsAtom.reportWrite(value, super.clientsFilterTags, () {
      super.clientsFilterTags = value;
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

  final _$searchClientsFilterAsyncAction =
      AsyncAction('_ClientSearchControllerBase.searchClientsFilter');

  @override
  Future<dynamic> searchClientsFilter() {
    return _$searchClientsFilterAsyncAction
        .run(() => super.searchClientsFilter());
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
  dynamic changeClientsFiltersOptions(Map<String, dynamic> value) {
    final _$actionInfo =
        _$_ClientSearchControllerBaseActionController.startAction(
            name: '_ClientSearchControllerBase.changeClientsFiltersOptions');
    try {
      return super.changeClientsFiltersOptions(value);
    } finally {
      _$_ClientSearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeClientsFiltersOption(String value) {
    final _$actionInfo =
        _$_ClientSearchControllerBaseActionController.startAction(
            name: '_ClientSearchControllerBase.changeClientsFiltersOption');
    try {
      return super.changeClientsFiltersOption(value);
    } finally {
      _$_ClientSearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeClientsFilterTags(String value) {
    final _$actionInfo =
        _$_ClientSearchControllerBaseActionController.startAction(
            name: '_ClientSearchControllerBase.changeClientsFilterTags');
    try {
      return super.changeClientsFilterTags(value);
    } finally {
      _$_ClientSearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clientsFiltersOptions: ${clientsFiltersOptions},
clientsFiltersOption: ${clientsFiltersOption},
clientsFilterTags: ${clientsFilterTags},
clients: ${clients},
isFormValid: ${isFormValid}
    ''';
  }
}
