import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pharma_retail/language/view/language_screen.dart';
import 'package:pharma_retail/splash_screen/view/splash_screen.dart';
import 'package:pharma_retail/user/presentation/add_shipping_address/view/add_shipping_address_screen.dart';
import 'package:pharma_retail/user/presentation/filter/view/filter_screen.dart';
import 'package:pharma_retail/user/presentation/order_details/view/order_details_screen.dart';
import 'package:pharma_retail/user/presentation/orders/view/orders_screen.dart';
import 'package:pharma_retail/user/presentation/payment_method/view/payment_method_screen.dart';
import 'package:pharma_retail/user/presentation/recomendation_product/view/recomendation_product_screen.dart';
import 'package:pharma_retail/user/presentation/salvage_product/view/salvage_product_screen.dart';
import 'package:pharma_retail/user/presentation/search/view/search_screen.dart';
import 'package:pharma_retail/user/presentation/success_otp_verification/view/success_otp_verification_screen.dart';
import '../../user/presentation/add_payment_method_screen/view/add_payment_method_screen.dart';
import '../../user/presentation/group_details/view/group_details_screen.dart';
import '../../user/presentation/layout/view/layout_screen.dart';
import '../../login/view/login_screen.dart';
import '../../user/presentation/locations/view/locations_screen.dart';
import '../../user/presentation/my_cart/view/my_cart_screen.dart';
import '../../user/presentation/otp_verification/view/otp_verification_screen.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String languageRoute = "/languageRoute";
  static const String loginRoute = "/loginRoute";
  static const String layoutRoute = "/layoutRoute";
  static const String salvageProductRoute = "/salvageProductRoute";
  static const String recomendationProductRoute = "/recomendationProductRoute";
  static const String searchRoute = "/searchRoute";
  static const String filterRoute = "/filterRoute";
  static const String myCartRoute = "/myCartRoute";
  static const String paymentMethodRoute = "/paymentMethodRoute";
  static const String addPaymentMethodRoute = "/addPaymentMethodRoute";
  static const String otpVerificationRoute = "/otpVerificationRoute";
  static const String successOtpVerificationRoute =
      "/successOtpVerificationRoute";
  static const String ordersRoute = "/ordersRoute";
  static const String locationsRoute = "/locationsRoute";
  static const String addShippingAddressRoute = "/addShippingAddressRoute";
  static const String orderDetailsRoute = "/orderDetailsRoute";
  static const String groupDetailsRoute = "/groupDetailsRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.layoutRoute:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );
      case Routes.languageRoute:
        return MaterialPageRoute(
          builder: (_) => const LanguageScreen(),
        );
      case Routes.salvageProductRoute:
        return MaterialPageRoute(
          builder: (_) => SalvageProductScreen(),
        );
      case Routes.searchRoute:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
        );
      case Routes.filterRoute:
        return MaterialPageRoute(
          builder: (_) => FilterScreen(),
        );
      case Routes.myCartRoute:
        return MaterialPageRoute(
          builder: (_) => MyCartScreen(),
        );
      case Routes.paymentMethodRoute:
        return MaterialPageRoute(
          builder: (_) => PaymentMethodScreen(),
        );
      case Routes.addPaymentMethodRoute:
        return MaterialPageRoute(
          builder: (_) => AddPaymentMethodScreen(),
        );
      case Routes.otpVerificationRoute:
        return MaterialPageRoute(
          builder: (_) => OtpVerificationScreen(),
        );
      case Routes.successOtpVerificationRoute:
        return MaterialPageRoute(
          builder: (_) => SuccessOtpVerificationScreen(),
        );
      case Routes.ordersRoute:
        return MaterialPageRoute(
          builder: (_) => OrdersScreen(),
        );
      case Routes.locationsRoute:
        return MaterialPageRoute(
          builder: (_) => const LocationsScreen(),
        );
      case Routes.addShippingAddressRoute:
        return MaterialPageRoute(
          builder: (_) => const AddShippingAddressScreen(),
        );
      case Routes.recomendationProductRoute:
        return MaterialPageRoute(
          builder: (_) => const RecomendationProductScreen(),
        );
      case Routes.orderDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => const OrderDetailsScreen(),
        );
      case Routes.groupDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => const GroupDetailsScreen(),
        );
      default:
        return unDefiendRoute();
    }
  }

  static Route<dynamic> unDefiendRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.notFound.tr()),
        ),
        body: Center(
          child: Text(
            AppStrings.notFound.tr(),
          ),
        ),
      ),
    );
  }
}
