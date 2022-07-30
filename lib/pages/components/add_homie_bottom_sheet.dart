// import 'package:flutter/material.dart';
// import 'package:homie/constants/colors.dart';
// import 'package:homie/constants/size_config.dart';
// import 'package:homie/constants/text_styles.dart';
// import 'package:homie/service/ether_service.dart';
// import 'package:homie/ui/components/global_form_field.dart';
//
// class AddHomieBottomSheet extends StatefulWidget {
//   const AddHomieBottomSheet({Key? key}) : super(key: key);
//
//   @override
//   State<AddHomieBottomSheet> createState() => _AddHomieBottomSheetState();
// }
//
// class _AddHomieBottomSheetState extends State<AddHomieBottomSheet> {
//   final walletController = TextEditingController();
//
//   final nameController = TextEditingController();
//
//   final lastNameController = TextEditingController();
//
//   final epochTimeController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       height: SizeConfig.heightAdjusted(130),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Add a Homie',
//                   style:
//                       GlobalTextStyles.mediumText(color: GlobalColors.black)),
//               SizedBox(height: SizeConfig.heightAdjusted(3)),
//               const Divider(),
//               SizedBox(height: SizeConfig.heightAdjusted(3)),
//               GestureDetector(
//                 onTap: () => Navigator.pop(context),
//                 child: const SizedBox(
//                     height: 30, width: 30, child: Icon(Icons.close)),
//               )
//             ],
//           ),
//           SizedBox(height: SizeConfig.heightAdjusted(3)),
//           const Divider(),
//           SizedBox(height: SizeConfig.heightAdjusted(3)),
//           GlobalFormField(
//               fieldName: 'First name',
//               keyBoardType: TextInputType.text,
//               textController: nameController),
//           SizedBox(height: SizeConfig.heightAdjusted(3)),
//           GlobalFormField(
//               fieldName: 'Last name',
//               keyBoardType: TextInputType.text,
//               textController: lastNameController),
//           SizedBox(height: SizeConfig.heightAdjusted(3)),
//           GlobalFormField(
//               fieldName: 'Wallet address',
//               keyBoardType: TextInputType.text,
//               textController: walletController),
//           SizedBox(height: SizeConfig.heightAdjusted(3)),
//           GlobalFormField(
//               fieldName: 'Withdrawal time',
//               keyBoardType: TextInputType.number,
//               textController: epochTimeController),
//           SizedBox(height: SizeConfig.heightAdjusted(18)),
//           GestureDetector(
//             onTap: () => EtherService().addKid(
//                 context: context,
//                 address: walletController.text,
//                 name: nameController.text,
//                 lastName: lastNameController.text),
//             child: Container(
//               width: double.infinity,
//               alignment: Alignment.center,
//               padding: EdgeInsets.symmetric(
//                   vertical: SizeConfig.heightAdjusted(4),
//                   horizontal: SizeConfig.widthAdjusted(2.5)),
//               decoration: BoxDecoration(
//                 color: GlobalColors.materialPrimaryColor,
//                 borderRadius:
//                     BorderRadius.circular(SizeConfig.heightAdjusted(10)),
//               ),
//               child: Text('Add now',
//                   style:
//                       GlobalTextStyles.mediumText(color: GlobalColors.white)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
