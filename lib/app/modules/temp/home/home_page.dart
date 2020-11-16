import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_controller.dart';
import '../../shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final AppController appController;

  final String title;

  const HomePage({
    Key key,
    this.appController,
    this.title = "Home",
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.acme(),
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