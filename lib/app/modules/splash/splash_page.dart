import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../shared/auth/repositories/interfaces/auth_repository_interface.dart';
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
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    Future.delayed(Duration(seconds: 3));
    var authRepository = Modular.get<IAuthRepository>();
    var response = await authRepository.getUser();
    var user = response.object;
    if (user == null) {
      Modular.to.pushNamed('/start');
    } else {
      //authRepository.signOut();
      Modular.to.pushNamed('/dashboard');
    }
  }

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
