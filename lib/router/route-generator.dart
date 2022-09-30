import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/router/routes-name.dart';

import '../screens/dash_board_screen.dart';
import '../screens/login/login.dart';
import '../screens/register/register.dart';
import 'generate-page-route.dart';


class RouteGenerator {
  static Widget _errorRoute() {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: NittivTheme().lightTheme,
      home: Scaffold(
        body: Center(
          child: Text("ERROR"),
        ),
      ),
    );
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final  widget = settings.arguments;
    final currentIndex = settings.arguments;

    switch (settings.name) {
      case RoutesName.LOGIN_URL:
        return GeneratePageRoute(widget: const Login(), routeName: settings.name);

      case RoutesName.REGISTER_URL:
        return GeneratePageRoute(widget: const Register(), routeName: settings.name);


      case RoutesName.HOME_URL:
        return GeneratePageRoute(widget:  DashBoardScreen(), routeName: settings.name);

      // case RoutesName.PROFILE_URL:
      //   return GeneratePageRoute(widget:  ProfilePage(), routeName: settings.name);
      //
      // case RoutesName.INBOX_URL:
      //   return GeneratePageRoute(widget:  InboxPage(), routeName: settings.name);
      //
      // case RoutesName.UPDATE_URL:
      //   return GeneratePageRoute(widget:  UpdatePage(), routeName: settings.name);



    // case RoutesName.REGISTER_OPERATOR_URL:
    //   return GeneratePageRoute(
    //       widget: OperatorRegisterationForm(), routeName: settings.name);
    //
    // case RoutesName.REGISTER_TRAVELER_URL:
    //   return GeneratePageRoute(
    //       widget: TravelerRegisterationForm(), routeName: settings.name);

    // case RoutesName.REGISTER_OPERATOR_URL:
    //   if (userType is Object) {
    //     return GeneratePageRoute(
    //         widget: RegistrationPage(userType: userType as NittivUserType),
    //         routeName: settings.name);
    //   }
    //   break;
    //
    // case RoutesName.REGISTER_TRAVELER_URL:
    //   if (userType is Object) {
    //     return GeneratePageRoute(
    //         widget: RegistrationSequence(userType: userType as NittivUserType),
    //         routeName: settings.name);
    //   }
    //   break;

    // return GeneratePageRoute(
    //     widget: const RegistrationSequence(userType: userType),
    //     routeName: settings.name);

      default:
        return GeneratePageRoute(widget: _errorRoute(), routeName: settings.name);
    }
  }
}