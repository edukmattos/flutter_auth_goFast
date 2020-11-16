import 'package:flutter/material.dart';
import 'package:flutter_auth/app/modules/shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app_controller.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.pacifico(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Login Google'),
              onPressed: () async {
                await Modular.get<IAuthRepository>()
                    .signInGoogle()
                    .then((result) {
                  if (result.success) {
                    print(result.message);
                  } else {
                    print(result.message);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
