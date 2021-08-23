import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:twitter_app/controllers/twit_controller.dart';
import 'package:twitter_app/utility/app_state.dart';

class TwitScreen extends GetView<TwitController> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        body:
        Obx(() {
      if (controller.appState() == AppState.LOADING) {
        return Center(child: CircularProgressIndicator());
      }
      else {
        return Container(
            height:MediaQuery.of(context).size.height,
            child: Column(children: [
              Container(
                height:MediaQuery.of(context).size.height-200,
                child: SwipeCards(
                  matchEngine: controller.matchEngine,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: Text(
                        controller.swipeItems[index].content.text,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  },
                  onStackFinished: () {
                    controller.scaffoldKey.currentState!.showSnackBar(SnackBar(
                      content: Text("Stack Finished"),
                      duration: Duration(milliseconds: 500),
                    ));
                    controller.addList();
                  },
                ),
              ),
            ]));
      }})
      );
  }
}

