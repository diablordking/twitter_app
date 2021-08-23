import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twitter_app/models/twit_model.dart';
import 'package:twitter_app/utility/constants.dart';



 Future<List<TwitModel>> test() async {

  final queryParameters = {
    'query': 'one',
  };
  var uri = Uri.https('api.twitter.com', '/2/tweets/search/recent', queryParameters);
  var response = await http.get(uri,headers: {"Authorization": "Bearer $BEARER_TOKEN" ,"Content-Type": "application/json"} );
  var decode =jsonDecode(response.body);
  //print(decode);
  List<TwitModel> list = (jsonDecode(response.body)["data"] as List).map((value)=>TwitModel.fromJson(value)).toList();

  return list;

}

void main() {
  var number = 42; // Declare and initialize a variable.
  test(); // Call a function.
}