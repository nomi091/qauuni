// import 'package:get/get_navigation/src/routes/get_route.dart';
// import 'package:qauuni/view/auth_screen/signup_screen.dart';
// import 'package:qauuni/view/splash_screen/splash_screen.dart';

// import '../view/auth_screen/login_screen.dart';
// import '../view/bus_point/bus_point.dart';
// import '../view/connection_check/InternetCheckView.dart';
// import '../view/home_screen/home.dart';
// import '../view/lost_find/lost_find.dart';
// import '../view/profile_screen/about_us.dart';
// import '../view/profile_screen/contact_us.dart';
// import '../view/profile_screen/terms_conditions.dart';

// class Routes {
//   static const String login = "/login";
//   static const String singup = "/signup";
//   static const String splash = "/splash";
//   static const String home = "/home";
//   static const String busPoint = "/busPoint";
//   static const String lostFind = "/lostFind";
//   static const String aboutUs = "/aboutUs";
//   static const String contactUs = "/contactUs";
//   static const String terms = "/terms";
//   static const String internetCheckView = "/internetCheckView";

//   static var list = [
//     GetPage(
//       name: internetCheckView,
//       page: () => const InternetCheckView(),
//     ),
//     // GetPage(
//     //   name: splashScreen,
//     //   page: () => const SplashScreen(),
//     //   binding: SplashBinding(),
//     // ),
//     // GetPage(
//     //   name: dashboardScreen,
//     //   page: () => DashboardScreen(),
//     //   binding: DashboardBinding(),
//     // ),
//     GetPage(
//       name: login,
//       page: () => const LoginScreen(),
//     ),
//     GetPage(
//       name: singup,
//       page: () => const SignupScreen(),
//     ),
//     GetPage(
//       name: splash,
//       page: () => SplashScreen(),
//     ),
//     GetPage(
//       name: home,
//       page: () => Home(),
//     ),
//     GetPage(
//       name: busPoint,
//       page: () => BusPoint(),
//     ), GetPage(
//       name: lostFind,
//       page: () => LostFind(),
//     ),

//     GetPage(
//       name: splash,
//       page: () => AboutUs(),
//     ),
//     GetPage(
//       name: contactUs,
//       page: () => ContactUs(),
//     ),
//     GetPage(
//       name: terms,
//       page: () => Terms(),
//     ),
//   ];
// }

import 'package:flutter/material.dart';
import 'package:qauuni/routes/custom_page_route.dart';
import 'package:qauuni/view/bus_point/bus_point.dart';
import 'package:qauuni/view/bus_point/bus_point_data.dart';
import 'package:qauuni/view/home_screen/home.dart';
import 'package:qauuni/view/lost_find/add_lost_find.dart';
import 'package:qauuni/view/lost_find/lost_find.dart';
import 'package:qauuni/view/profile_screen/about_us.dart';
import 'package:qauuni/view/profile_screen/contact_us.dart';
import 'package:qauuni/view/profile_screen/terms_conditions.dart';
import 'package:qauuni/view/splash_screen/splash_screen.dart';

import '../view/auth_screen/login_screen.dart';
import '../view/auth_screen/signup_screen.dart';

class Routes {
  static const String login = "/login";
  static const String singup = "/signup";
  static const String splash = "/splash";
  static const String home = "/home";
  static const String busPoint = "/busPoint";
  static const String busPointData = "/busPointData";
  static const String lostFind = "/lostFind";
  static const String addFindLost = "/addFindLost";
  static const String aboutUs = "/aboutUs";
  static const String contactUs = "/contactUs";
  static const String terms = "/terms";
  static const String internetCheckView = "/internetCheckView";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// WalkThrough FLOW
      /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      case splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );

      /// Custom Page Route ///
      case singup:
        return CustomPageRoute(
          child: const SignupScreen(),
          direction: AxisDirection.right,
        );

      case login:
        return CustomPageRoute(
          child: const LoginScreen(),
          direction: AxisDirection.left,
        );

      case home:
        return CustomPageRoute(
          child: const Home(),
          direction: AxisDirection.left,
        );
      case busPoint:
        return CustomPageRoute(
          child: const BusPoint(),
          direction: AxisDirection.left,
        );
      case busPointData:
        return CustomPageRoute(
      
          child: const BusPointData(),
          direction: AxisDirection.left,
        );
      case lostFind:
        return CustomPageRoute(
          child: const LostFind(),
          direction: AxisDirection.left,
        );
      case addFindLost:
        return CustomPageRoute(
          child: const AddFindLost(),
          direction: AxisDirection.left,
        );
      case aboutUs:
        return CustomPageRoute(
          child: AboutUs(),
          direction: AxisDirection.left,
        );
      case contactUs:
        return CustomPageRoute(
          child: const ContactUs(),
          direction: AxisDirection.left,
        );
      case terms:
        return CustomPageRoute(
          child: const Terms(),
          direction: AxisDirection.left,
        );

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
