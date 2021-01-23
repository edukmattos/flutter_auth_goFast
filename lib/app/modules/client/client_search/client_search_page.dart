import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'client_search_controller.dart';

class ClientSearchPage extends StatefulWidget {
  final String title;
  const ClientSearchPage({Key key, this.title = "Clientes"}) : super(key: key);

  @override
  _ClientSearchPageState createState() => _ClientSearchPageState();
}

class _ClientSearchPageState
    extends ModularState<ClientSearchPage, ClientSearchController> {
  //use 'controller' variable to access controller

  List<String> values = [];
  final FocusNode _focusNode = FocusNode();

  String _clientSearchFilters;

  @override
  void onDelete(index) {
    setState(() {
      values.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.thumb_up),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    child: Text('Nome/CPF/CNPJ'),
                    value: 'one',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Endereço'),
                    value: 'two',
                  ),
                ],
                onChanged: (String value) {
                  setState(() {
                    _clientSearchFilters = value;
                  });
                },
                hint: Text('filtrar'),
                value: _clientSearchFilters,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ),
            TagEditor(
              length: values.length,
              focusNode: _focusNode,
              delimiters: [',', ' '],
              hasAddButton: false,
              resetTextOnSubmitted: true,
              textStyle: TextStyle(
                color: Colors.grey,
              ),
              onSubmitted: (outstandingValue) {
                setState(() {
                  values.add(outstandingValue);
                });
              },
              inputDecoration: InputDecoration(
                //border: OutlineInputBorder(),
                //enabledBorder: OutlineInputBorder(),
                //focusedBorder: OutlineInputBorder(),
                hintText: 'Hint Text...',
              ),
              onTagChanged: (newValue) {
                setState(() {
                  values.add(newValue);
                });
              },
              tagBuilder: (context, index) => _Chip(
                index: index,
                label: values[index],
                onDeleted: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    @required this.label,
    @required this.onDeleted,
    @required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
