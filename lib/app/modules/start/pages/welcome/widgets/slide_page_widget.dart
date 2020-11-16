import 'package:flutter/material.dart';
import 'package:flutter_auth/app/core/config/constants.dart';

import '../../../../../core/config/app_colors_config.dart';

class SlidePageWidget extends StatelessWidget {
  final String text;
  final String asset;

  const SlidePageWidget({
    Key key,
    this.text = '',
    this.asset = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          text,
          style: kFontTextStyle20,
        ),
        Container(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              asset,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
          ),
        )
      ],
    );
  }
}
