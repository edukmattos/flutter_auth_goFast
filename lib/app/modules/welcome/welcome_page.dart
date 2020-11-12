import 'package:flutter/material.dart';
import 'package:flutter_auth/app/modules/auth/login/login_module.dart';
import 'package:flutter_auth/app/modules/auth/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/config/app_colors_config.dart';
import '../../core/features/localization/app_translate.dart';
import 'welcome_controller.dart';
import 'widgets/slide_widget.dart';
import 'widgets/slot_dots_widget.dart';

class WelcomePage extends StatefulWidget {
  final String title;
  const WelcomePage({
    Key key,
    this.title = "Welcome",
  }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends ModularState<WelcomePage, WelcomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: PageView(
          controller: controller.pageViewController,
          children: [
            Container(),
            Container(),
            RouterOutlet(module: LoginModule()),
          ],
        ),
        bottomNavigationBar: AnimatedBuilder(
            animation: controller.pageViewController,
            builder: (context, snapshot) {
              return BottomNavigationBar(
                currentIndex: controller.pageViewController?.page?.round() ?? 0,
                onTap: (index) {
                  controller.pageViewController.jumpToPage(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Config'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), label: 'Perfil'),
                ],
              );
            }));
  }
}
