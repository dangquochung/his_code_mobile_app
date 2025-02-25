// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vnpt_his/gen/assets.gen.dart';

// class CustomTangGiam extends StatefulWidget {
//   final Widget text; // Cho phép truyền bất kỳ widget nào làm nội dung
//   final int initialValue;
//   final ValueChanged<int>? onValueChanged;

//   const CustomTangGiam({
//     Key? key,
//     required this.text,
//     required this.initialValue,
//     this.onValueChanged,
//   }) : super(key: key);

//   @override
//   State<CustomTangGiam> createState() => _CustomTangGiamState();
// }

// class _CustomTangGiamState extends State<CustomTangGiam> {
//   late int value;

//   @override
//   void initState() {
//     super.initState();
//     value = widget.initialValue;
//   }

//   void increase() {
//     setState(() {
//       value++;
//       widget.onValueChanged?.call(value);
//     });
//   }

//   void decrease() {
//     setState(() {
//       if (value > 0) value--;
//       widget.onValueChanged?.call(value);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(
//           color: Colors.grey.shade300,
//           width: 1.0,
//         ),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Flexible(
//             child: widget.text,
//           ),
//           Row(
//             children: [
//               GestureDetector(
//                 onTap: decrease,
//                 child: SvgPicture.asset(
//                   Assets.images.home.icGiamBtn,
//                   height: 18,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Text(
//                 '$value',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               GestureDetector(
//                 onTap: increase,
//                 child: SvgPicture.asset(
//                   Assets.images.home.icTangBtn,
//                   height: 18,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
