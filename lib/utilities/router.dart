import 'package:ecommerce/utilities/routes.dart';
import 'package:ecommerce/view/pages/bottom_navbar.dart';
import 'package:ecommerce/view/pages/product_details_page.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';
import '../view/pages/auth_page.dart';
import '../view/pages/landing_page.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginPageRoute:
      return CupertinoPageRoute(
        builder: (_) => const AuthPage(),
        settings: settings,
      );
    case AppRoutes.bottomNavBarRoute:
      return CupertinoPageRoute(
        builder: (_) => const BootomNavBar(),
        settings: settings,
      );
    case AppRoutes.productDetailsRoute:
      final product = settings.arguments as Product;
      return CupertinoPageRoute(
        builder: (_) => ProductDetailsPage(product: product),
        settings: settings,
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
