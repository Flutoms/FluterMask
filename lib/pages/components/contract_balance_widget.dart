// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:homie/constants/colors.dart';
// import 'package:homie/constants/size_config.dart';
// import 'package:homie/constants/text_styles.dart';
// import 'package:homie/service/ether_service.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
//
// import 'add_homie_bottom_sheet.dart';
//
// var polygonBalance = StateProvider((ref) => 0.0);
//
// class ContractBalanceWidget extends StatefulWidget {
//   const ContractBalanceWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ContractBalanceWidget> createState() => _ContractBalanceWidgetState();
// }
//
// class _ContractBalanceWidgetState extends State<ContractBalanceWidget> {
//   var usdBalance = '0.0';
//   late WebSocketChannel channel;
//
//   @override
//   void initState() {
//     channel = WebSocketChannel.connect(
//         Uri.parse('wss://ws.coincap.io/prices?assets=polygon'));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, watch, child) {
//       var contractBal = watch(contractBalance).state;
//       return Center(
//         child: Column(children: [
//           Text('Contract balance ',
//               style: GlobalTextStyles.regularText(color: GlobalColors.black)),
//           Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text('MATIC ',
//                       style: GlobalTextStyles.mediumText(
//                           color: GlobalColors.black.withAlpha(100))),
//                   Text(contractBal.toString(),
//                       style: GlobalTextStyles.boldText(
//                           fontSize: 4, color: GlobalColors.black)),
//                 ],
//               ),
//               SizedBox(width: SizeConfig.widthAdjusted(3)),
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text('\$ ',
//                       style: GlobalTextStyles.mediumText(
//                           color: GlobalColors.black.withAlpha(100))),
//                   StreamBuilder(
//                       stream: channel.stream,
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           var jsonBody = jsonDecode(snapshot.data as String);
//                           var ethereumPrice =
//                               double.tryParse(jsonBody['polygon']);
//                           usdBalance =
//                               (ethereumPrice! * contractBal).toStringAsFixed(3);
//                         }
//                         return Text(usdBalance,
//                             style: GlobalTextStyles.boldText(
//                                 fontSize: 4, color: GlobalColors.black));
//                       })
//                 ],
//               )
//             ],
//           ),
//           SizedBox(height: SizeConfig.heightAdjusted(6)),
//           GestureDetector(
//             onTap: () => showModalBottomSheet(
//                 context: context,
//                 isScrollControlled: true,
//                 backgroundColor: Colors.transparent,
//                 builder: (context) => const AddHomieBottomSheet()),
//             child: Container(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: SizeConfig.heightAdjusted(3),
//                     vertical: SizeConfig.heightAdjusted(2.5)),
//                 decoration: BoxDecoration(
//                     color: GlobalColors.primaryGreen,
//                     borderRadius: BorderRadius.circular(30)),
//                 child: Text('Add homie',
//                     style: GlobalTextStyles.mediumText(
//                         color: GlobalColors.white))),
//           )
//         ]),
//       );
//     });
//   }
// }
