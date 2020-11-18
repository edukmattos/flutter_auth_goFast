import 'package:flutter/material.dart';
import 'package:flutter_auth/app/widgets/drawer/app_drawer_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_controller.dart';
import '../../core/config/constants.dart';
import '../../core/features/localization/app_translate.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatefulWidget {
  final AppController appController;
  final String title;
  const DashboardPage({
    Key key,
    this.appController,
    this.title = "Dashboard",
  }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  //use 'controller' variable to access controller

  @override
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppTranslate(context).text('signIn.title'),
            style: kPageTitleTextStyle20,
          ),
          Visibility(
            visible: true,
            child: Text(
              AppTranslate(context).text('signIn.subTitle'),
              style: kPageSubTitleTextStyle14,
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppTranslate(context).text('dashboard.title'),
              style: kPageTitleTextStyle20,
            ),
          ],
        ),
        actions: [
          Observer(
            builder: (_) {
              return Switch(
                value: controller.appController.isDark,
                onChanged: (value) {
                  controller.appController.appCtrlThemeSwitch();
                },
              );
            },
          ),
        ],
      ),
      drawer: AppDrawerWidget(),
      body: _getDrawerItem(_selectedIndex),
    );
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
      //return Fragment("Tela 1");
      case 1:
      //return Fragment("Tela 2");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop();
  }
}
