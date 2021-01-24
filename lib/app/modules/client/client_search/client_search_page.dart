import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_auth/app/core/config/constants.dart';
import 'package:flutter_auth/app/core/features/localization/app_translate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_tag_editor/tag_editor.dart';

import '../../../core/config/app_config.dart';
import 'client_search_controller.dart';

class ClientSearchPage extends StatefulWidget {
  final String title;
  final String subtitle;

  const ClientSearchPage(
      {Key key,
      this.title = appPageTagClient,
      this.subtitle = appPageTagFunctionSearch})
      : super(key: key);

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
    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppTranslate(context).text('clients.title'),
            style: kPageTitleTextStyle20,
          ),
          Visibility(
            visible: true,
            child: Text(
              AppTranslate(context).text('operations.search'),
              style: kPageSubTitleTextStyle14,
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Modular.to.pushReplacementNamed('/clients/new');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            FlatButton(
              onPressed: () {},
              child: Text(
                "Enviar",
              ),
            )
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
