import 'package:duck_duck_shop/constants.dart';
import 'package:duck_duck_shop/data.dart';
import 'package:duck_duck_shop/route_transitions.dart';
import 'package:flutter/widgets.dart';

import 'screens/shop/item_detail_page.dart';
import 'screens/shop/shop_page.dart';
import 'screens/splash/splash_page.dart';

class Coordinators {
  static Future<void> toShop(BuildContext context) async {
    await Navigator.of(context).pushAndRemoveUntil<void>(
      RouteTransition.fadeIn(ShopPage(), name: AppRoutes.start),
      (Route<void> route) => false,
    );
  }

  static Future<void> toSplash(BuildContext context) async {
    await Navigator.of(context).pushAndRemoveUntil(
      RouteTransition.fadeIn(SplashPage(isColdStart: false), name: AppRoutes.start),
      (Route<void> route) => false,
    );
  }

  static Future<void> toDetail(BuildContext context, ItemData item) async {
    await Navigator.of(context).push(RouteTransition.slideIn(ItemDetailPage(item: item)));
  }
}
