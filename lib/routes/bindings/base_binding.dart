import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'package:twitter_app/controllers/base_controller.dart';
import 'package:twitter_app/controllers/twit_controller.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(
          () => BaseController(),
    );

    Get.lazyPut<TwitController>(
          () => TwitController(),
    );


    // Get.lazyPut<RegisterController>(
    //   () => RegisterController(
    //     Get.find<AuthRepository>(),
    //   ),
    // );
  }
}
