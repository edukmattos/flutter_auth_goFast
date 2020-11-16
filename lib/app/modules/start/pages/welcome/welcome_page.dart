import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/config/constants.dart';
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
  Widget _buildSignInBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      //width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Modular.to.pushNamed('/login');
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.blue,
        child: Text(
          AppTranslate(context).text('welcome.signIn'),
          // ignore: lines_longer_than_80_chars
          style: controller.appController.isDark
              ? kDarkButtonTextStyle20
              : kLightButtonTextStyle20,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

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
      //appBar: appBar,
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
                        SizedBox(
                          height: kDefaultPaddin * 1.0,
                        ),
                        Text(
                          AppTranslate(context).text('welcome.message'),
                          style: kFontTextStyle30,
                        ),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        SlideWidget(
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        SlideDotsWidget(
                          currentPage: currentIndex,
                        ),
                        SizedBox(
                          height: _height * 0.06,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: _buildSignInBtn(),
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
