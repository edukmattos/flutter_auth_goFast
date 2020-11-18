import 'package:flutter/material.dart';

Widget appDrawerHeaderWidget() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    //decoration: BoxDecoration(
    //  image: DecorationImage(
    //    fit: BoxFit.fill,
    //    image: AssetImage('assets/images/app/drawer_header_background.png'),
    //  ),
    //),
    child: Stack(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text("user@mail.com"),
          accountName: Text("Seu zé"),
          currentAccountPicture: CircleAvatar(
            child: Text("SZ"),
          ),
        ),
      ],
    ),
  );
}
