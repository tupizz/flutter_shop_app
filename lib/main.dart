import 'package:flutter/material.dart';
import 'package:flutter_shop_app/app/shared/utils/color_utils.dart';

import './app/pages/products-overview/products_overview_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: ColorUtils.hexToColor('#3d0e1e'),
        accentColor: ColorUtils.hexToColor('#d1274b'),
        canvasColor: ColorUtils.hexToColor('#fff4e4'),
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewPage(),
    );
  }
}
