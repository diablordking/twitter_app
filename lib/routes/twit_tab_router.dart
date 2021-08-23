import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';

import 'package:twitter_app/screens/twit_screen.dart';

import 'bindings/like_binding.dart';

class TwitTabRouter extends StatelessWidget {
  static const navigatorIndex = 1000;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(navigatorIndex),
      initialRoute: '/',
      onGenerateRoute: onGenerateRouter,
    );
  }

  static Route onGenerateRouter(RouteSettings settings) {
    if (settings.name == '/') {
      return GetPageRoute(
        settings: settings,
        page: () => TwitScreen(),
        binding: LikeBinding(),
      );
    }
    // if (settings.name == Routers.storesByCategory) {
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => StoresPage(
    //       category: settings.arguments,
    //     ),
    //     binding: StoresBindind(),
    //   );
    // }
    //
    // if (settings.name == Routers.storeDetail) {
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => StoreDetailPage(
    //       store: settings.arguments,
    //     ),
    //     binding: StoresDetailBindind(),
    //   );
    // }

    throw Exception('No Page');
  }
}