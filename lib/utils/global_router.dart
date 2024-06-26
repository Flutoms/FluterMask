import 'package:metamask/pages/login_page.dart';
import 'package:metamask/pages/wallet_page.dart';
import 'package:metamask/utils/routes.dart';
import 'package:page_transition/page_transition.dart';

class GlobalRouter {
  GlobalRouter._();

  static generateRoutes(settings) {
    if (settings.name == Routes.walletPage) {
      return PageTransition(
          child: const WalletPage(),
          type: PageTransitionType.fade,
          settings: settings);
    }
    if (settings.name == Routes.loginRoute) {
      return PageTransition(
          child: const LoginPage(),
          type: PageTransitionType.fade,
          settings: settings);
    }
  }
}
