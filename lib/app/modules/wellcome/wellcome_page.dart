import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/config/app_colors_config.dart';
import '../../core/features/localization/app_translate.dart';
import 'wellcome_controller.dart';
import 'widgets/slide_widget.dart';
import 'widgets/slot_dots_widget.dart';

class WellcomePage extends StatefulWidget {
  final String title;
  const WellcomePage({Key key, this.title = "Wellcome"}) : super(key: key);

  @override
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState
    extends ModularState<WellcomePage, WellcomeController> {
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
                      AppTranslate(context).text('wellcome.message' ?? ''),
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
                    RaisedButton(
                      onPressed: controller.wellcomeCtrlSignInEmailPassword,
                      child: Text(
                        AppTranslate(context).text('wellcome.login_now' ?? ''),
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
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
                          AppTranslate(context).text('wellcome.or' ?? ''),
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
                      color: Colors.red,
                      // ignore: lines_longer_than_80_chars
                      onPressed: () async =>
                          controller.wellcomeCtrlSignInGoogle(),
                      child: Text(
                        // ignore: lines_longer_than_80_chars
                        AppTranslate(context)
                            .text('wellcome.login_google' ?? ''),
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
