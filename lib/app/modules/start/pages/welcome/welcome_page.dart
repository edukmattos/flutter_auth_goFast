import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/app/core/config/app_config.dart';
import 'package:flutter_auth/app/core/config/constants.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/config/app_colors_config.dart';
import '../../../../core/features/localization/app_translate.dart';
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
    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title),
          Visibility(
            visible: true,
            child: Text(
              'widget.subtitle',
              style: TextStyle(fontSize: 12.0),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      //floatingActionButton: _buildSpeedDial(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      //bottomNavigationBar: _buildBottomBar(),
      body: Form(
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
                        //Text(
                        //  'Autenticação',
                        //  style: TextStyle(
                        //    color: Colors.white,
                        //    fontFamily: 'OpenSans',
                        //    fontSize: 30.0,
                        //    fontWeight: FontWeight.bold,
                        //  ),
                        //),
                        Text(
                          AppTranslate(context).text('welcome.message'),
                          style: GoogleFonts.adventPro(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
