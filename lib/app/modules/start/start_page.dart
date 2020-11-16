import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../dashboard/dashboard_module.dart';
import 'pages/about/about_page.dart';
import 'pages/contact/contact_page.dart';
import 'pages/welcome/welcome_page.dart';
import 'start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key key, this.title = "Start"}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, StartController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageViewController,
        children: [
          WelcomePage(),
          ContactPage(),
          AboutPage(),
          RouterOutlet(module: DashboardModule()),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controller.pageViewController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            unselectedItemColor: Colors.blue,
            selectedItemColor: Colors.red,
            currentIndex: controller.pageViewController?.page?.round() ?? 0,
            onTap: (index) {
              controller.pageViewController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.ac_unit), label: 'Welcome'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Config'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Perfil'),
            ],
          );
        },
      ),
    );
  }
}
