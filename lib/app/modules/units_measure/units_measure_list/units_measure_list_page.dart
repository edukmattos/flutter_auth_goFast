import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'units_measure_list_controller.dart';

class UnitsMeasureListPage extends StatefulWidget {
  final String title;
  const UnitsMeasureListPage({Key key, this.title = "UnitsMeasureList"})
      : super(key: key);

  @override
  _UnitsMeasureListPageState createState() => _UnitsMeasureListPageState();
}

class _UnitsMeasureListPageState
    extends ModularState<UnitsMeasureListPage, UnitsMeasureListController> {
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
