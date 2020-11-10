import 'package:flutter/material.dart';
import 'package:flutter_auth/app/modules/home/home_page.dart';
import 'package:flutter_auth/app/modules/wellcome/wellcome_module.dart';
import 'package:flutter_auth/app/modules/wellcome/wellcome_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:splashscreen/splashscreen.dart';

import '../auth/login/login_page.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 2,
          routeName: "/",
          onClick: () => print("Flutter Egypt"),
          title: Text(
            'Welcome In SplashScreen',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xffED213A), Color(0xff93291E)],
          ),
          navigateAfterSeconds: WellcomePage(),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logos/app_logo.png"),
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
