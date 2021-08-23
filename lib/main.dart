


import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:twitter_app/routes/pages.dart';
import 'package:twitter_app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StarterApp());
}



class StarterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.full,
      // initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Ponte Delivery',
      initialRoute: Routers.home,
      getPages: Pages.getPages,
      //theme: Themes.light,
    );
  }
}


