// import 'package:flutter/material.dart';
// import 'package:homie/constants/global_navigator.dart';
// import 'package:homie/constants/size_config.dart';
// import 'package:homie/constants/text_styles.dart';
//
// import '../../../constants/colors.dart';
//
// class BackButtonWidgetB extends StatelessWidget {
//   const BackButtonWidgetB({Key? key, required this.title})
//       : super(key: key);
//
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//           top: SizeConfig.heightAdjusted(12),
//           left: SizeConfig.widthAdjusted(1.4),
//           right: SizeConfig.widthAdjusted(1)),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () => globalPop(context: context),
//             child: Container(
//               padding: EdgeInsets.only(
//                   left: SizeConfig.widthAdjusted(1.8),
//                   right: SizeConfig.widthAdjusted(.8),
//                   top: SizeConfig.widthAdjusted(.8),
//                   bottom: SizeConfig.heightAdjusted(1.8)),
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                       color: GlobalColors.white)),
//               child: Icon(Icons.arrow_back_ios,
//                   size: SizeConfig.imageAdjusted(5),
//                   color: GlobalColors.white),
//             ),
//           ),
//           SizedBox(width: SizeConfig.widthAdjusted(3)),
//           Text(title,
//               style: GlobalTextStyles.mediumText(fontSize: 2.5, color: GlobalColors.white))
//         ],
//       ),
//     );
//   }
// }
