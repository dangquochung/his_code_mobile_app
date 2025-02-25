// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

// class CustomDropdownFormField extends ConsumerWidget {
//   final String hint;
//   final List<String> items;
//   final String? value;
//   final Function(String?) onChanged;
//   final String? errorText;

//   const CustomDropdownFormField({
//     Key? key,
//     required this.hint,
//     required this.items,
//     required this.onChanged,
//     this.value,
//     this.errorText,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2(
//         isExpanded: true,
//         hint: Row(
//           children: [
//             Container(
//               width: 2,
//               height: 24,
//               color: const Color.fromRGBO(63, 138, 205, 1), 
//             ),
//             const SizedBox(width: 8),
//             Text(
//               hint,
//               style: const TextStyle(
//                 color: Colors.black,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//         items: items.map((String item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: Text(item),
//           );
//         }).toList(),
//         value: value,
//         onChanged: onChanged,
//         customButton: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.transparent),
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.white,
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 2,
//                 height: 24,
//                 color: const Color.fromRGBO(63, 138, 205, 1), 
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: Text(
//                   value ?? hint,
//                   style: const TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//               ),
//               const Icon(
//                 Icons.keyboard_arrow_down,
//                 color: Colors.black,
//               ),
//             ],
//           ),
//         ),
//         dropdownStyleData: DropdownStyleData(
//           maxHeight: 200,
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.white,
//             border: Border.all(color: Colors.grey[300]!),
//           ),
//           offset: const Offset(0, 8),
//         ),
//         menuItemStyleData: const MenuItemStyleData(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//         ),
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
// }