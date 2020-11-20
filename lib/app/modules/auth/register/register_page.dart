import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/config/app_config.dart';
import '../../../core/config/constants.dart';
import '../../../core/features/localization/app_translate.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  //use 'controller' variable to access controller

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildEmailTF() {
    return Observer(
      name: 'observerEmail',
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              decoration: controller.appController.isDark
                  ? kBoxDecorationStyleDark
                  : kBoxDecorationStyleLight,
              height: kDefaultPaddin * 2.5,
              child: Padding(
                padding: EdgeInsets.only(top: kDefaultPaddin * 0.00),
                child: TextFormField(
                  onChanged: controller.changeEmail,
                  autofocus: false,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //border: InputBorder.none,
                    labelText: AppTranslate(context).text('register.email'),
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(
                      top: kDefaultPaddin * 0.0,
                    ),

                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin * 0.0,
                        vertical: kDefaultPaddin * 0.0,
                      ),
                      child: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: kDefaultPaddin * 1.00,
                        end: kDefaultPaddin * 0.25,
                      ),
                      child: controller.validateEmail() == null
                          ? null
                          : Text(
                              controller.validateEmail(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12),
                            ),
                    ),
                    //hintText: 'E-mail',
                    //hintStyle: kHintTextStyle,

                    //errorText: controller.validateEmail(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPasswordTF() {
    return Observer(
      name: 'observerPassord',
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Text(
            //  'E-mail',
            //  style: kLabelStyle,
            //),
            //SizedBox(height: kDefaultPaddin * 0.5),
            Container(
              alignment: Alignment.centerLeft,
              // ignore: lines_longer_than_80_chars
              decoration: controller.appController.isDark
                  ? kBoxDecorationStyleDark
                  : kBoxDecorationStyleLight,
              height: kDefaultPaddin * 2.5,
              child: Padding(
                padding: EdgeInsets.only(top: kDefaultPaddin * 0.00),
                child: TextFormField(
                  onChanged: controller.changePassword,
                  autofocus: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //border: InputBorder.none,
                    labelText: AppTranslate(context).text('register.password'),
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(
                      top: kDefaultPaddin * 0.0,
                    ),

                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin * 0.0,
                        vertical: kDefaultPaddin * 0.0,
                      ),
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: kDefaultPaddin * 1.00,
                        end: kDefaultPaddin * 0.25,
                      ),
                      child: controller.validatePassword() == null
                          ? null
                          : Text(
                              controller.validatePassword(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12),
                            ),
                    ),
                    //hintText: 'E-mail',
                    //hintStyle: kHintTextStyle,

                    //errorText: controller.validateEmail(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPasswordConfirmTF() {
    return Observer(
      name: 'observerPassord',
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Text(
            //  'E-mail',
            //  style: kLabelStyle,
            //),
            //SizedBox(height: kDefaultPaddin * 0.5),
            Container(
              alignment: Alignment.centerLeft,
              // ignore: lines_longer_than_80_chars
              decoration: controller.appController.isDark
                  ? kBoxDecorationStyleDark
                  : kBoxDecorationStyleLight,
              height: kDefaultPaddin * 2.5,
              child: Padding(
                padding: EdgeInsets.only(top: kDefaultPaddin * 0.00),
                child: TextFormField(
                  onChanged: controller.changePasswordConfirm,
                  autofocus: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //border: InputBorder.none,
                    labelText:
                        AppTranslate(context).text('register.passwordConfirm'),
                    labelStyle: kLabelStyle,
                    contentPadding: EdgeInsets.only(
                      top: kDefaultPaddin * 0.0,
                    ),

                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin * 0.0,
                        vertical: kDefaultPaddin * 0.0,
                      ),
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: kDefaultPaddin * 1.00,
                        end: kDefaultPaddin * 0.25,
                      ),
                      child: controller.validatePasswordConfirm() == null
                          ? null
                          : Text(
                              controller.validatePasswordConfirm(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12),
                            ),
                    ),
                    //hintText: 'E-mail',
                    //hintStyle: kHintTextStyle,

                    //errorText: controller.validateEmail(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSignUpBtn() {
    return Observer(
        name: 'submitButtonObserver',
        builder: (_) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: RaisedButton(
              elevation: 5.0,
              onPressed: controller.isFormValid
                  ? () async {
                      controller
                          .registerCtrlSignUp(
                        email: controller.email,
                        password: controller.password,
                      )
                          .catchError((error) {
                        var scnackbar = SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(error.message),
                        );
                        _scaffoldKey.currentState.showSnackBar(scnackbar);
                      });
                    }
                  : null,
              padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.blue,
              child: Text(
                AppTranslate(context).text('register.submit'),
                // ignore: lines_longer_than_80_chars
                style: controller.appController.isDark
                    ? kDarkButtonTextStyle20
                    : kLightButtonTextStyle20,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppTranslate(context).text('register.title'),
            style: kPageTitleTextStyle20,
          ),
          Visibility(
            visible: true,
            child: Text(
              AppTranslate(context).text('register.subTitle'),
              style: kPageSubTitleTextStyle14,
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      key: _scaffoldKey,
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
                        Text(
                          AppTranslate(context).text('register.title'),
                          style: kFontTextStyle30,
                        ),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildEmailTF(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildPasswordTF(),
                        SizedBox(
                          height: kDefaultPaddin * 0.5,
                        ),
                        _buildPasswordConfirmTF(),
                        _buildSignUpBtn(),
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
