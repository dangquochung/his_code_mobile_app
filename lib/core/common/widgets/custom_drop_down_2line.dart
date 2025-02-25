// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

// class CustomDropdownFormField2Line extends ConsumerWidget {
//   final String hint;
//   final List<String> items;
//   final String? value;
//   final Function(String?) onChanged;
//   final String? errorText;

//   const CustomDropdownFormField2Line({
//     Key? key,
//     required this.hint,
//     required this.items,
//     required this.onChanged,
//     this.value,
//     this.errorText,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       padding: const EdgeInsets.all(8), // Outer padding
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.grey[300]!, // Inner border color
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton2(
//             isExpanded: true,
//             hint: Row(
//               children: [
//                 Container(
//                   width: 2,
//                   height: 24,
//                   color: const Color.fromRGBO(63, 138, 205, 1),
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   hint,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             items: items.map((String item) {
//               return DropdownMenuItem<String>(
//                 value: item,
//                 child: Text(
//                   item,
//                   style: const TextStyle(fontSize: 14), // Giảm kích thước text
//                 ),
//               );
//             }).toList(),
//             value: value,
//             onChanged: onChanged,
//             customButton: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Giảm padding dọc
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       value ?? hint,
//                       style: const TextStyle(color: Colors.black, fontSize: 16),
//                     ),
//                   ),
//                   const Icon(
//                     Icons.keyboard_arrow_down,
//                     color: Colors.grey,
//                   ),
//                 ],
//               ),
//             ),
//             dropdownStyleData: DropdownStyleData(
//               maxHeight: 200,
//               padding: const EdgeInsets.symmetric(horizontal: 8), // Giảm padding tổng thể
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: Colors.white,
//                 border: Border.all(color: Colors.grey.shade300),
//               ),
//               offset: const Offset(0, 8),
//             ),
//             menuItemStyleData: const MenuItemStyleData(
//               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Giảm padding item
//             ),
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 14, // Giảm font size
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }