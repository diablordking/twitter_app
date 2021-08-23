import 'package:get/get.dart';
import 'package:twitter_app/routes/routes.dart';
import 'package:twitter_app/screens/base_page.dart';

import 'bindings/base_binding.dart';

class Pages {
  static List<GetPage> getPages = [
    // GetPage(
    //   name: Routers.initialRoute,
    //   page: () => MainScreen(),
    // ),

    GetPage(
      name: Routers.home,
      page: () => BasePage(),
     binding: BaseBinding()
    )
  ];
}