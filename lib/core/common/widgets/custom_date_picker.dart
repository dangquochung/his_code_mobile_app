// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';

// class DatePickerView extends StatefulWidget {
//   final Function(DateTime) onDateSelected;

//   const DatePickerView({Key? key, required this.onDateSelected})
//       : super(key: key);

//   @override
//   State<DatePickerView> createState() => _DatePickerViewState();
// }

// class _DatePickerViewState extends State<DatePickerView> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: TableCalendar(
//         firstDay: DateTime.utc(2023, 1, 1),
//         lastDay: DateTime.utc(2024, 12, 31),
//         focusedDay: _focusedDay,
//         selectedDayPredicate: (day) {
//           return isSameDay(_selectedDay, day);
//         },
//         onDaySelected: (selectedDay, focusedDay) {
//           setState(() {
//             _selectedDay = selectedDay;
//             _focusedDay = focusedDay;
//           });
//           widget.onDateSelected(selectedDay);
//         },
//         headerStyle: HeaderStyle(
//           titleCentered: true,
//           formatButtonVisible: false,
//           titleTextStyle: const TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w500,
//           ),
//           leftChevronIcon: Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.blue.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Icon(Icons.chevron_left, color: Colors.blue),
//           ),
//           rightChevronIcon: Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.blue.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Icon(Icons.chevron_right, color: Colors.blue),
//           ),
//           titleTextFormatter: (date, locale) {
//             return 'Tháng ${DateFormat.M().format(date)}';
//           },
//         ),
//         daysOfWeekStyle: const DaysOfWeekStyle(
//           weekdayStyle: TextStyle(color: Colors.blue),
//           weekendStyle: TextStyle(color: Colors.blue),
//         ),
//         calendarStyle: CalendarStyle(
//           outsideDaysVisible: false,
//           defaultTextStyle: const TextStyle(color: Colors.blue),
//           weekendTextStyle: const TextStyle(color: Colors.blue),
//           selectedDecoration: BoxDecoration(
//             color: const Color.fromRGBO(63, 138, 205, 1),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           todayDecoration: BoxDecoration(
//             color: Colors.transparent,
//             border: Border.all(color: const Color.fromRGBO(63, 138, 205, 1)),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           todayTextStyle:
//               const TextStyle(color: Color.fromRGBO(63, 138, 205, 1)),
//         ),
//         calendarBuilders: CalendarBuilders(
//           dowBuilder: (context, day) {
//             final text = DateFormat.E().format(day);
//             return Center(
//               child: Text(
//                 text.substring(0, 1),
//                 style: const TextStyle(color: Color.fromRGBO(63, 138, 205, 1)),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
