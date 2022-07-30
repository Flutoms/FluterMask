// import 'dart:math';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:fade_shimmer/fade_shimmer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:homie/constants/colors.dart';
// import 'package:homie/constants/size_config.dart';
// import 'package:homie/constants/text_styles.dart';
// import 'package:homie/service/ether_service.dart';
// import 'package:homie/ui/withdraw_widget.dart';
//
// import 'contract_balance_widget.dart';
//
// class HomieListWidget extends ConsumerWidget {
//   const HomieListWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, watch) {
//     var listOfHomies = watch(homieList).state;
//     return Expanded(
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(SizeConfig.heightAdjusted(2)),
//         decoration: BoxDecoration(
//             color: GlobalColors.washedBlack,
//             borderRadius:
//                 const BorderRadius.vertical(top: Radius.circular(30))),
//         child: listOfHomies.isNotEmpty
//             ? MediaQuery.removePadding(
//                 context: context,
//                 removeTop: true,
//                 child: GridView.builder(
//                   itemCount: listOfHomies[0].length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisExtent: 220,
//                       crossAxisSpacing: SizeConfig.widthAdjusted(1),
//                       mainAxisSpacing: SizeConfig.widthAdjusted(1.5)),
//                   itemBuilder: (context, index) => HomieItem(
//                       listOfHomies: listOfHomies[0][index], index: index),
//                 ),
//               )
//             : SizedBox.shrink(),
//       ),
//     );
//   }
// }
//
// class HomieItem extends ConsumerWidget {
//   const HomieItem({
//     Key? key,
//     required this.listOfHomies,
//     required this.index,
//   }) : super(key: key);
//
//   final List listOfHomies;
//   final int index;
//
//   @override
//   Widget build(BuildContext context, watch) {
//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 WithdrawalScreen(index: index, address: listOfHomies[0], name: listOfHomies[1])),
//       ),
//       child: Hero(
//         tag: index,
//         child: Container(
//             decoration: BoxDecoration(
//                 color: GlobalColors.white,
//                 borderRadius: const BorderRadius.vertical(
//                     top: Radius.circular(30), bottom: Radius.circular(20))),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(30)),
//                 child: CachedNetworkImage(
//                   imageUrl: 'https://images.unsplash.com/photo-1624272949900-'
//                       '9ae4c56397e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90'
//                       'by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
//                   fit: BoxFit.cover,
//                   height: 150,
//                   width: double.infinity,
//                   placeholder: (context, url) => const FadeShimmer(
//                     highlightColor: Color(0xffF9F9FB),
//                     baseColor: Color(0xffE6E8EB),
//                     height: double.infinity,
//                     width: double.infinity,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: SizeConfig.widthAdjusted(1.5),
//                     vertical: SizeConfig.heightAdjusted(1.5)),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(listOfHomies[1],
//                         style: GlobalTextStyles.mediumText(
//                             color: GlobalColors.black)),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                             '${(listOfHomies[4].toDouble() / pow(10, 18))} MATIC',
//                             style: GlobalTextStyles.regularText(
//                                 fontSize: 1.5,
//                                 color: GlobalColors.black.withAlpha(100))),
//                         // Text('\$${(listOfHomies[4].toDouble() / pow(10, 18))*polygonValue}',
//                         //     style: GlobalTextStyles.regularText(
//                         //         fontSize: 1.5,
//                         //         color: GlobalColors.black.withAlpha(100)))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: SizeConfig.heightAdjusted(2))
//             ])),
//       ),
//     );
//   }
// }
