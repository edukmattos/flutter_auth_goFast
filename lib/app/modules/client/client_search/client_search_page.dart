import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../core/config/app_config.dart';
import '../../../core/config/constants.dart';
import '../../../core/features/localization/app_translate.dart';
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

  List<String> clientsTags = [];
  final FocusNode _focusNode = FocusNode();

  final List<Map<String, dynamic>> _clientFiltersOptions = [
    {
      'value': 'boxValue',
      'label': 'Nome/CPF/CNPJ',
      'enable': true,
      //'icon': Icon(Icons.stop),
      //'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'circleValue',
      'label': 'Endereço',
      'enable': true,
      //'icon': Icon(Icons.fiber_manual_record),
      //'textStyle': TextStyle(color: Colors.red),
    },
  ];

  String clientsFilter = "clientsFilterNameEinSsa";

  void onDelete(index) {
    setState(() {
      clientsTags.removeAt(index);
    });
  }

  Widget _buildClientsSearch() {
    return Form(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPaddin * 0.5),
          child: Column(
            children: [
              //TextFieldTags(
              //    tagsStyler: TagsStyler(
              //      tagTextStyle: TextStyle(
              //          fontWeight: FontWeight.bold, color: Colors.white),
              //      tagDecoration: BoxDecoration(
              //        color: const Color.fromARGB(255, 171, 81, 81),
              //        borderRadius: BorderRadius.circular(8.0),
              //      ),
              //      tagCancelIcon: Icon(Icons.cancel,
              //          size: 16.0, color: Color.fromARGB(255, 235, 214, 214)),
              //      tagPadding: const EdgeInsets.all(10.0),
              //    ),
              //    textFieldStyler: TextFieldStyler(),
              //    onTag: controller.changeClientsFilter,
              //    //onTag: (tag) {},
              //    onDelete: (tag) {}),
              SelectFormField(
                //controller: controller.clientsFilter,
                type: SelectFormFieldType.dropdown,
                initialValue: 'circle',
                //icon: Icon(Icons.format_shapes),
                labelText: 'Filtrar por',
                items: _clientFiltersOptions,
                onChanged: controller.changeClientsFilter,
                //onSaved: (val) => print(val),
              ),
              TagEditor(
                autofocus: true,
                length: clientsTags.length,
                focusNode: _focusNode,
                delimiters: [',', ';', '-', ' '],
                hasAddButton: false,
                resetTextOnSubmitted: true,
                textStyle: TextStyle(
                    //color: Colors.grey,
                    ),
                onSubmitted: (outstandingValue) {
                  setState(
                    () {
                      clientsTags.add(outstandingValue);
                    },
                  );
                },
                inputDecoration: InputDecoration(
                  //border: OutlineInputBorder(),
                  //enabledBorder: OutlineInputBorder(),
                  //focusedBorder: OutlineInputBorder(),
                  hintText: 'Tags ...',
                ),
                //onTagChanged: controller.changeClientsTags,
                onTagChanged: (newValue) {
                  setState(() {
                    clientsTags.add(newValue);
                  });
                },
                tagBuilder: (context, index) => _Chip(
                  index: index,
                  label: clientsTags[index],
                  onDeleted: onDelete,
                ),
              ),
              //ButtonBar(
              //  alignment: MainAxisAlignment.spaceBetween,
              //  children: [
              //    DropdownButton<String>(
              //      isDense: false,
              //      items: [
              //        DropdownMenuItem<String>(
              //          child: Text('Nome/CPF/CNPJ'),
              //          value: 'clientsFilterNameEinSsa',
              //        ),
              //        DropdownMenuItem<String>(
              //          child: Text('Endereço'),
              //          value: 'clientsFilterAddress',
              //        ),
              //      ],
              //      onChanged: (String value) {
              //        setState(
              //          () {
              //            clientsFilter = value;
              //          },
              //        );
              //      },
              //      //hint: Text('filtrar'),
              //      value: clientsFilter,
              //    ),
              //    _submitButton(),
              //  ],
              //),
              _submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClientsResult() {
    return Observer(
      name: 'clientListObserver',
      builder: (context) {
        if (controller.clients.hasError) {
          print(controller.clients.hasError);
          return Center(
            child: Text('Erro a realizar a pesquisa !'),
          );
        }

        if (controller.clients.value == null) {
          return Center(
              child: LinearProgressIndicator(
            backgroundColor: Colors.green,
          ));
        }

        var list = controller.clients.value;
        print(list);

        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          reverse: false,
          itemCount: controller.clients.value.length,
          itemBuilder: (context, index) {
            var model = list[index];
            //print(model.name);
            return _getListTile(model);
          },
        );
      },
    );
  }

  Widget _submitButton() {
    return Observer(
      name: 'submitButtonObserver',
      builder: (_) {
        return RaisedButton(
          elevation: 5.0,
          onPressed: controller.isFormValid
              ? () async {
                  print("Client Saved !");
                  //var result = await controller.save();
                  ////print(result);
                  //if (result) {
                  //  Modular.to.pushReplacementNamed('/clients');
                  //} else {
                  //  //_flushBar();
                  //}
                }
              : null,
          padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          //color: Colors.blue,
          child: Text(
            AppTranslate(context).text('fields.submit'),
            // ignore: lines_longer_than_80_chars
            //style: controller.appController.isDark
            //    ? kDarkButtonTextStyle20
            //    : kLightButtonTextStyle20,
          ),
        );
      },
    );
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
        padding: const EdgeInsets.all(kDefaultPaddin * 0.2),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildClientsSearch(),
            _buildClientsResult(),
          ],
        ),
      ),
    );
  }
}

ListTile _getListTile(model) {
  print(model.einSsa);
  return ListTile(
    leading: _getLeadingWidget(),
    title: _getTitleWidget('${model.name}'),
    subtitle: _getSubtitleWidget('${model.einSsa}'),
    isThreeLine: false,
    trailing: Icon(Icons.keyboard_arrow_right, size: 40.0),
    //selected: false,
    onLongPress: () {
      print("onLongPress");
    },
    onTap: () {
      print("onLongPress");
    },
  );
}

CircleAvatar _getLeadingWidget() {
  return CircleAvatar();
}

Text _getTitleWidget(String modelName) {
  return Text(
    modelName,
    //style: TextStyle(fontWeight: FontWeight.bold),
  );
}

Text _getSubtitleWidget(String modelEinSSa) {
  return Text(
    modelEinSSa,
    //style: TextStyle(fontWeight: FontWeight.bold),
  );
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
