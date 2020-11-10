import 'package:flutter/material.dart';

import '../../../core/config/app_assets_config.dart';
import '../../../core/features/localization/app_translate.dart';
import 'slide_page_widget.dart';

class SlideWidget extends StatelessWidget {
  final ValueChanged<int> onPageChanged;

  const SlideWidget({Key key, this.onPageChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: PageView(
          physics: BouncingScrollPhysics(),
          onPageChanged: onPageChanged,
          children: <Widget>[
            SlidePageWidget(
              text: AppTranslate(context).text('wellcome.text_step1' ?? ''),
              asset: AppAssetsConfig.step001,
            ),
          ],
        ),
      ),
    );
  }
}
