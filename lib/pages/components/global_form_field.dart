// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:homie/constants/colors.dart';
// import 'package:homie/constants/size_config.dart';
//
// class GlobalFormField extends StatefulWidget {
//
//   final String fieldName;
//   final TextInputType keyBoardType;
//   final TextEditingController textController;
//   final int maxLength;
//   final isEyeVisible;
//   final textLength;
//   bool obscureText;
//   final bool isAutoFocus;
//
//   GlobalFormField(
//       {Key? key,
//       required this.fieldName,
//       required this.keyBoardType,
//       required this.textController,
//       this.obscureText = false,
//       this.isEyeVisible = false,
//       this.isAutoFocus = false,
//       this.textLength = 100,
//       this.maxLength = 35})
//       : super(key: key);
//
//   @override
//   State<GlobalFormField> createState() => _GlobalFormFieldState();
// }
//
// class _GlobalFormFieldState extends State<GlobalFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.textController,
//       keyboardType: widget.keyBoardType,
//       obscureText: widget.obscureText,
//       obscuringCharacter: '*',
//       autofocus: widget.isAutoFocus,
//       style: TextStyle(
//           fontSize: SizeConfig.textAdjusted(1.9),
//           height: SizeConfig.textAdjusted(0.12)),
//       decoration: InputDecoration(
//         hintText: widget.fieldName,
//         hintStyle: TextStyle(
//             fontSize: SizeConfig.textAdjusted(1.8),
//             height: SizeConfig.textAdjusted(0.1)),
//         filled: true,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: GlobalColors.black.withAlpha(50)),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: GlobalColors.primaryGreen),
//         ),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(color: Colors.red)),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: GlobalColors.primaryGreen),
//         ),
//       ),
//     );
//   }
// }
