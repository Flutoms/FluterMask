import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metamask/pages/login_page.dart';
import 'package:metamask/pages/wallet_page.dart';

import 'utils/ether_service.dart';
import 'utils/size_config.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              home: listenableSession.value == null
                  ? const LoginPage()
                  : const WalletPage(),
              debugShowCheckedModeBanner: false,
            );
          });
        }));
  }
}
