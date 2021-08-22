import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ralle_e/src/features/app/presentation/pages/home_page.dart';

import 'controllers/socket_controller.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SocketController(), permanent: true);
    return GetMaterialApp(
      initialRoute: HomePage.routeName,
      getPages: [
        GetPage(name: HomePage.routeName, page: ()=> HomePage())
      ],
    );
  }
}
