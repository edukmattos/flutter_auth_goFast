import 'package:flutter/material.dart';
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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppTranslate(context).text('welcome.message' ?? ""),
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SlideWidget(
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                    SlideDotsWidget(
                      currentPage: currentIndex,
                    ),
                    SizedBox(
                      height: _height * 0.06,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            // ignore: lines_longer_than_80_chars
                            height: 1,
                            color: AppColorsConfig.grey400,
                            width: 100),
                        Text(
                          AppTranslate(context).text('welcome.or' ?? ""),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: AppColorsConfig.grey600),
                        ),
                        Container(
                            // ignore: lines_longer_than_80_chars
                            height: 1,
                            color: AppColorsConfig.grey400,
                            width: 100),
                      ],
                    ),
                    SizedBox(
                      height: _height * 0.04,
                    ),
                    RaisedButton(
                      onPressed: controller.welcomeCtrlSignInEmailPassword,
                      child: Text(
                        AppTranslate(context).text('welcome.login_now' ?? ""),
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
