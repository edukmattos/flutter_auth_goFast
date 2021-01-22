import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'client_search_controller.dart';

class ClientSearchPage extends StatefulWidget {
  final String title;
  const ClientSearchPage({Key key, this.title = "ClientSearch"})
      : super(key: key);

  @override
  _ClientSearchPageState createState() => _ClientSearchPageState();
}

class _ClientSearchPageState
    extends ModularState<ClientSearchPage, ClientSearchController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
