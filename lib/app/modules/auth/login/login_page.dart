import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/config/app_config.dart';
import '../../../core/config/constants.dart';
import '../../../core/features/localization/app_translate.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  @override
  bool _rememberMe = false;
  bool _submmiting = false;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildAuthLogo() {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 60.0,
      //backgroundImage: AssetImage(appLogoImgPath),
    );
  }

  Widget _buildEmailTF() {
    return Observer(
      name: 'observerEmail',
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
                    labelText: AppTranslate(context).text('signIn.email'),
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
                    labelText: AppTranslate(context).text('signIn.password'),
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          AppTranslate(context).text('signIn.recovery'),
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            AppTranslate(context).text('signIn.recovery'),
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildSignInBtn() {
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
                          .loginCtrlEmailPasswordSignIn(
                        email: controller.email,
                        password: controller.password,
                      )
                          .catchError(
                        (error) {
                          var scnackbar = SnackBar(
                            content: Text(error.message),
                          );
                          _scaffoldKey.currentState.showSnackBar(scnackbar);
                        },
                      );
                    }
                  : null,
              padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.blue,
              child: Text(
                AppTranslate(context).text('signIn.submit'),
                // ignore: lines_longer_than_80_chars
                style: controller.appController.isDark
                    ? kDarkButtonTextStyle20
                    : kLightButtonTextStyle20,
              ),
            ),
          );
        });
  }

  Widget _googleButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: GoogleSignInButton(
        darkMode: controller.appController.isDark,
        onPressed: () async {
          controller.loginCtrlGoogleSignIn().catchError(
            (error) {
              var scnackbar = SnackBar(
                duration: Duration(seconds: 3),
                content: Text(
                  error.message,
                  style: kFontTextStyle15,
                ),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                elevation: double.maxFinite,
              );
              _scaffoldKey.currentState.showSnackBar(scnackbar);
            },
          );
        },
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: AppTranslate(context).text('signIn.dont_have_account'),
              style: kFontTextStyle15,
            ),
            TextSpan(
              text: AppTranslate(context).text('signIn.register'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Modular.to.pushNamed('/register');
                },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppTranslate(context).text('signIn.title'),
            style: kPageTitleTextStyle20,
          ),
          Visibility(
            visible: true,
            child: Text(
              AppTranslate(context).text('signIn.subTitle'),
              style: kPageSubTitleTextStyle14,
            ),
          )
        ],
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
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
                        _buildAuthLogo(),
                        Text(
                          AppTranslate(context).text('signIn.title'),
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
                        _buildForgotPasswordBtn(),
                        _buildRememberMeCheckbox(),
                        _buildSignInBtn(),
                        _googleButton(),
                        _buildSignupBtn(),
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
