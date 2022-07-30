// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:homie/constants/colors.dart';
// import 'package:homie/constants/size_config.dart';
// import 'package:homie/constants/text_styles.dart';
// import 'package:homie/service/ether_service.dart';
//
// class HomiesWidget extends ConsumerWidget {
//   const HomiesWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, watch) {
//     var listOfHomies = watch(homieList).state;
//     return Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(
//             horizontal: SizeConfig.heightAdjusted(3),
//             vertical: SizeConfig.heightAdjusted(2.5)),
//         decoration: BoxDecoration(
//             color: GlobalColors.peach, borderRadius: BorderRadius.circular(30)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//                 listOfHomies.isNotEmpty
//                     ? '${listOfHomies[0].length} Homies'
//                     : '0 Homies',
//                 style: GlobalTextStyles.mediumText(color: GlobalColors.black)),
//             Image.asset('assets/children.png', height: 22)
//           ],
//         ));
//   }
// }
