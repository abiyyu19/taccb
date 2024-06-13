import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taccb/help_center/help_center.dart';
import 'package:taccb/privacy.dart';
import 'package:taccb/route_name.dart';
import 'package:taccb/term_of_service.dart';

class CBDocsApp extends StatelessWidget {
  const CBDocsApp({super.key});

  @override
  Widget build(_) => GetMaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: "KLIKJOB's Legal Documents",
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.privacy,
        getPages: [
          GetPage(
            name: RoutesName.privacy,
            page: () => Privacy(),
            binding: PrivacyBinding(),
          ),
          GetPage(
            name: RoutesName.helpCenter,
            page: () => const HelpCenter(),
          ),
          GetPage(
            name: RoutesName.termOfService,
            page: () => const TermOfService(),
          ),
        ],
      );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class PrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyController>(() => PrivacyController());
  }
}
