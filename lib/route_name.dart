import 'package:flutter/material.dart';
import 'package:taccb/help_center/help_center.dart';
import 'package:taccb/privacy.dart';
import 'package:taccb/term_of_service.dart';

class RoutesName {
  // ignore: non_constant_identifier_names
  static const String privacy = '/privacy';
  // ignore: non_constant_identifier_names
  static const String helpCenter = '/helpcenter';
  static const String termOfService = '/termofservice';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.privacy:
        return _GeneratePageRoute(
          widget: Privacy(),
          routeName: RoutesName.privacy,
        );
      case RoutesName.helpCenter:
        return _GeneratePageRoute(
          widget: const HelpCenter(),
          routeName: RoutesName.helpCenter,
        );
      case RoutesName.termOfService:
        return _GeneratePageRoute(
          widget: const TermOfService(),
          routeName: RoutesName.termOfService,
        );
      default:
        return _GeneratePageRoute(
          widget: Privacy(),
          routeName: '/',
        );
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                textDirection: TextDirection.rtl,
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
