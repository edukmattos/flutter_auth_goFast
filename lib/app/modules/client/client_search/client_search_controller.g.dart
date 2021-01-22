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

  @override
  String toString() {
    return '''
clients: ${clients}
    ''';
  }
}
