import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:twitter_app/routes/routes.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();

  final _pageViewController = PageController(keepPage: true);

  get pageViewController => _pageViewController;

  void signout() {
    Get.offAllNamed(Routers.initialRoute);
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  void onReady() {

    super.onReady();
  }
}
