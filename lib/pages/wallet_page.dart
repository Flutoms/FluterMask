import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metamask/pages/components/address_component.dart';
import 'package:metamask/utils/colors.dart';
import 'package:metamask/utils/ether_service.dart';
import 'package:metamask/utils/multi_value_listenable.dart';
import 'package:metamask/utils/size_config.dart';
import 'package:metamask/utils/text_styles.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  var usdBalance = '0.0';
  late WebSocketChannel channel;

  @override
  void initState() {
    channel = WebSocketChannel.connect(
        Uri.parse('wss://ws.coincap.io/prices?assets=polygon'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiValueListenableBuilder(
        valueListenables: [listenableBal],
        builder: (context, listenables, child) {
          String walletBal = listenables[0];
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: GlobalColors.polygonColor,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.heightAdjusted(3),
                      right: SizeConfig.heightAdjusted(3),
                      bottom: SizeConfig.heightAdjusted(9),
                      top: SizeConfig.heightAdjusted(15),
                    ),
                    child: Column(
                      children: [
                        const AddressComponent(),
                        SizedBox(height: SizeConfig.heightAdjusted(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(walletBal,
                                    style: GlobalTextStyles.medium(
                                        fontSize: 20,
                                        color: GlobalColors.white)),
                                Text('MATIC ',
                                    style: GlobalTextStyles.medium(
                                        fontSize: 14,
                                        color: GlobalColors.washedWhite))
                              ],
                            ),
                            SizedBox(width: SizeConfig.heightAdjusted(3)),
                            Container(
                                height: 40,
                                width: 1,
                                color: GlobalColors.washedWhite),
                            SizedBox(width: SizeConfig.heightAdjusted(3)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(r'$',
                                    style: GlobalTextStyles.medium(
                                        fontSize: 12,
                                        color: GlobalColors.washedWhite)),
                                StreamBuilder(
                                    stream: channel.stream,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        var jsonBody =
                                            jsonDecode(snapshot.data as String);
                                        var ethereumPrice = double.tryParse(
                                            jsonBody['polygon']);
                                        usdBalance = (ethereumPrice! *
                                                double.tryParse(walletBal)!)
                                            .toStringAsFixed(3);
                                      }
                                      return Text(usdBalance,
                                          style: GlobalTextStyles.medium(
                                              fontSize: 25,
                                              color: GlobalColors.white));
                                    })
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.heightAdjusted(3),
                      right: SizeConfig.heightAdjusted(3),
                      top: SizeConfig.heightAdjusted(3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Transactions',
                          style: GlobalTextStyles.regularText(
                            fontSize: 14,
                              color: GlobalColors.green)),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
