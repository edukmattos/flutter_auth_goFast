import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> clientsTags = [];

  final List<Map<String, dynamic>> _clientFiltersOptions = [
    {
      'value': 'boxValue',
      'label': 'Nome',
      'enable': true,
      //'icon': Icon(Icons.stop),
      //'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'boxValue',
      'label': 'CPF/CNPJ',
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

  Widget _buildClientsFiltersOptions() {
    return Observer(
      name: 'observerlientsFiltersOptions',
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              decoration: controller.appController.isDark
                  ? kBoxDecorationStyleDark
                  : kBoxDecorationStyleLight,
              height: kDefaultPaddin * 2.5,
              child: Padding(
                padding: EdgeInsets.only(top: kDefaultPaddin * 0),
                child: SelectFormField(
                  // ignore: lines_longer_than_80_chars
                  onChanged: controller.changeClientsFiltersOptions(),
                  type: SelectFormFieldType.dialog,
                  initialValue: 'circle',
                  //enableSearch: true,
                  //icon: Icon(Icons.format_shapes),
                  labelText: AppTranslate(context).text('fields.filter'),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //border: InputBorder.none,
                    labelText: AppTranslate(context).text('fields.filter'),
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(
                      top: kDefaultPaddin * 0.0,
                    ),

                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin * 0.0,
                        vertical: kDefaultPaddin * 0.0,
                      ),
                      child: Icon(
                        Icons.filter,
                        //color: Colors.white,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: kDefaultPaddin * 1.00,
                        end: kDefaultPaddin * 0.25,
                      ),
                      child: controller.validateClientsFiltersOptions() == null
                          ? null
                          : Text(
                              controller.validateClientsFiltersOptions(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12),
                            ),
                    ),
                  ),
                  items: _clientFiltersOptions,
                  //onSaved: (val) => print(val),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildClientsFiltersTags() {
    return Observer(
      name: 'observerlientsFiltersTags',
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              decoration: controller.appController.isDark
                  ? kBoxDecorationStyleDark
                  : kBoxDecorationStyleLight,
              height: kDefaultPaddin * 2.5,
              child: Padding(
                padding: EdgeInsets.only(top: kDefaultPaddin * 0),
                child: TextFormField(
                  onChanged: controller.changeClientsFilterTags,
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //border: InputBorder.none,
                    labelText: AppTranslate(context).text('fields.tags'),
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(
                      top: kDefaultPaddin * 0.0,
                    ),

                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin * 0.0,
                        vertical: kDefaultPaddin * 0.0,
                      ),
                      child: Icon(
                        Icons.email,
                        //color: Colors.white,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: kDefaultPaddin * 1.00,
                        end: kDefaultPaddin * 0.25,
                      ),
                      child: controller.validateClientsFilterTag() == null
                          ? null
                          : Text(
                              controller.validateClientsFilterTag(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildClientsResult() {
    return Observer(
      name: 'clientListObserver',
      builder: (context) {
        if (controller.clients.hasError) {
          print(controller.clients.value);
          print(controller.clients.hasError);
          return Center(
            child: Text('Erro a realizar a pesquisa !'),
          );
        }

        if (controller.clients.value == null) {
          return Center(
            child: LinearProgressIndicator(
              backgroundColor: Colors.green,
            ),
          );
        }

        if (controller.clients.value.isEmpty) {
          return Container(
            width: 0.0,
            height: 0.0,
          );
        }

        var list = controller.clients.value;
        //print(list);

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
                  var list = await controller.searchClientsFilter();
                  //print(controller.searchClients());
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
      key: _scaffoldKey,
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
      body: Form(
        key: _formKey,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: controller.appController.isDark
                      ? kBoxDecorationStyleBackgroundDark
                      : kBoxDecorationStyleBackgroundLight,
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddin,
                      vertical: kDefaultPaddin,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildClientsFiltersOptions(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildClientsFiltersTags(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _submitButton(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildClientsResult()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
    trailing: Icon(Icons.keyboard_arrow_right, size: 30.0),
    selected: true,
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
    style: TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  );
}

Text _getSubtitleWidget(String modelEinSSa) {
  return Text(
    modelEinSSa,
    style: TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.yellow,
    ),
  );
}
