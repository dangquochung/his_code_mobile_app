// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vnpt_his/gen/assets.gen.dart';

// void showCustomModalBottomSheet(
//   BuildContext context, {
//   required Color backgroundColor,
//   required String title,
//   required Widget content,
// }) {
//   showModalBottomSheet(
//     context: context,
//     backgroundColor: Colors.transparent,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return Padding(
//         padding: const EdgeInsets.only(
//           top: 50, 
//         ),
//         child: Container(
//           height: MediaQuery.of(context).size.height - 50,
//           padding: const EdgeInsets.only(left: 0, right: 0), 
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 16,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//             color: backgroundColor,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(16),
//               topRight: Radius.circular(16),
//             ),
//             border: Border.all(
//               color: const Color.fromRGBO(216, 246, 250, 1),
//               width: 1,
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min, 
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: SvgPicture.asset(
//                       Assets.images.home.icCloseBtn,
//                       height: 16,
//                     ),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   const SizedBox(width: 48),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Expanded(  
//                 child: content,
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }