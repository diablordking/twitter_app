import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:twitter_app/models/content.dart';
import 'package:twitter_app/models/twit_model.dart';
import 'package:twitter_app/utility/app_state.dart';
import 'package:twitter_app/utility/constants.dart';

class TwitController extends GetxController {
  var appState = Rx<AppState>(AppState.LOADING);

  static TwitController get to => Get.find();

  List<SwipeItem> swipeItems = <SwipeItem>[];
  late MatchEngine matchEngine = MatchEngine();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  void addList() async {
    appState.value = AppState.LOADING;

    Future<List<TwitModel>> _names = getData();

    _names.then((value) => value.forEach((element) {
          swipeItems.add(SwipeItem(
              content: Content(text: element.text),
              likeAction: () {
                scaffoldKey.currentState!.showSnackBar(SnackBar(
                  content: Text("Liked twit"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              nopeAction: () {
                scaffoldKey.currentState!.showSnackBar(SnackBar(
                  content: Text("Nope twit"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              superlikeAction: () {
                scaffoldKey.currentState!.showSnackBar(SnackBar(
                  content: Text("Superliked twit"),
                  duration: Duration(milliseconds: 500),
                ));
              }));
    })).then((value) {
      appState.value = AppState.DONE;
    });
    matchEngine = MatchEngine(swipeItems: swipeItems);
  }

  Future<List<TwitModel>> getData() async {
    final queryParameters = {
      'query': 'one',
    };
    var uri = Uri.https(
        'api.twitter.com', '/2/tweets/search/recent', queryParameters);
    var response = await http.get(uri, headers: {
      "Authorization": "Bearer $BEARER_TOKEN",
      "Content-Type": "application/json"
    });
    var decode = jsonDecode(response.body);
    //print(decode);
    List<TwitModel> list = (jsonDecode(response.body)["data"] as List)
        .map((value) => TwitModel.fromJson(value))
        .toList();
    return list;
  }

  @override
  void onInit() {
    addList();
    super.onInit();
  }
}
