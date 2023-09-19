import 'package:flutter/material.dart';
import 'package:learn_api/data/network/error_handler.dart';
import 'package:learn_api/presentaion/screens/main_screen/main/main_view.dart';
import 'package:learn_api/presentaion/screens/register/register_view.dart';

import '../../app/di.dart';
import '../screens/forget_password/forget_password_view.dart';
import '../screens/login/view/login_view.dart';
import '../screens/obboarding/view/onboarding_view.dart';

// class Go {
//   final BuildContext context;
//   Go(this.context);

//   Future push({
//     required Widget page,
//     bool withoutRoot = true,
//     bool withoutPageTransition = false,
//   }) async {
//     PageRoute route = withoutPageTransition
//         ? MaterialPageRoute(
//             builder: (context) => page, maintainState: !withoutRoot)
//         : CupertinoPageRoute(
//             builder: (context) => page, maintainState: !withoutRoot);
//     return Navigator.of(context, rootNavigator: withoutRoot).push(route);
//   }

//   Future<bool> back() => Navigator.maybePop(context);
// }

// toast(String toast) {
//   return Fluttertoast.showToast(
//       msg: toast,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: ColorManager.black,
//       textColor: ColorManager.white);
// }
//
class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splashRoute:
      //   return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      case Routes.forgotPasswordRoute:
        initForgetPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
         case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
