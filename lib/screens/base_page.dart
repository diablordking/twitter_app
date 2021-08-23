import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:twitter_app/controllers/base_controller.dart';
import 'package:twitter_app/routes/twit_tab_router.dart';


class BasePage extends GetView<BaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text("Twitter"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              controller.signout();
            },
          )
        ],
      ),
      body: GetBuilder<BaseController>(
          builder: (tx) =>  PageView(
            physics: new NeverScrollableScrollPhysics(),
            controller: controller.pageViewController,
            children: <Widget>[
              TwitTabRouter(),
              TwitTabRouter(),

            ],
          )),
      bottomNavigationBar: AnimatedBuilder(
          animation: controller.pageViewController,
          builder: (_, __) {
            return GetBuilder<BaseController>(
                builder: (tx) =>  BottomNavigationBar(

                  selectedItemColor: Colors.green[600],
                  unselectedItemColor: Colors.grey,
                  currentIndex:
                  controller.pageViewController?.page?.round() ?? 0,
                  onTap: (page) {
                    controller.pageViewController.jumpToPage(page);
                  },
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite), label: "Beğeniler"),
                    BottomNavigationBarItem(icon: Icon(Icons.wc), label: "Keşfet")
                  ],
                ));
          }),
    );
  }
}
