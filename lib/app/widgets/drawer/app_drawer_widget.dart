import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/features/localization/app_translate.dart';
import 'app_drawer_header_widget.dart';
import 'app_drawer_item_widget.dart';

class AppDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          appDrawerHeaderWidget(),
          appDrawerItemWidget(
              icon: Icons.contacts,
              text: AppTranslate(context).text('clients.title'),
              onTap: () {
                Modular.to.pushNamed('/clients/dashboard');
              }),
          appDrawerItemWidget(
            icon: Icons.event,
            text: 'Events',
          ),
          appDrawerItemWidget(
            icon: Icons.note,
            text: 'Notes',
          ),
          Divider(),
          appDrawerItemWidget(
            icon: Icons.collections_bookmark,
            text: 'Steps',
          ),
          appDrawerItemWidget(
            icon: Icons.face,
            text: 'Authors',
          ),
          // ignore: lines_longer_than_80_chars
          appDrawerItemWidget(
            icon: Icons.account_box,
            text: 'Flutter Documentation',
          ),
          appDrawerItemWidget(
            icon: Icons.stars,
            text: 'Useful Links',
          ),
          Divider(),
          appDrawerItemWidget(
            icon: Icons.logout,
            text: AppTranslate(context).text('drawer.logout'),
            onTap: () {},
          ),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
