
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

Widget buildCardSwiper() {
    List<Map<String, String>> cardData = [
      {
        "name": "Nguyễn Duy Tùng",
        "phone": "0964 535 677",
        "time": "10h 30p",
        "room": "Phòng khám số 3",
        "date": "Ngày 22 tháng 01 năm 20XX",
        "image": "https://randomuser.me/api/portraits/men/1.jpg"
      },
      {
        "name": "Trần Văn Bình",
        "phone": "0978 123 456",
        "time": "14h 15p",
        "room": "Phòng khám số 5",
        "date": "Ngày 23 tháng 01 năm 20XX",
        "image": "https://randomuser.me/api/portraits/men/2.jpg"
      },
      {
        "name": "Lê Hoàng Nam",
        "phone": "0912 345 678",
        "time": "16h 45p",
        "room": "Phòng khám số 2",
        "date": "Ngày 24 tháng 01 năm 20XX",
        "image": "https://randomuser.me/api/portraits/men/3.jpg"
      },
    ];

    return SizedBox(
      height: 180, // Giữ nguyên chiều cao
      child: CardSwiper(
        cardsCount: cardData.length,
        numberOfCardsDisplayed: 3, // Hiển thị 3 thẻ phía sau
        backCardOffset: const Offset(0, 20), // Hiệu ứng xếp lớp
        padding: const EdgeInsets.all(16.0),
        threshold: 30, // 👈 Giới hạn swipe (30% màn hình là tối đa)
        cardBuilder: (context, index, horizontalThresholdPercentage,
            verticalThresholdPercentage) {
          return _buildAppointmentCard(cardData[index]);
        },
      ),
    );
  }


  Widget _buildAppointmentCard(Map<String, String> card) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(0, 99, 203, 1),
          Color.fromRGBO(11, 186, 255, 1),
        ],
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 8,
          offset: Offset(2, 4),
        ),
      ],
    ),
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        // Cột chứa hình ảnh
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(card["image"]!),
        ),
        SizedBox(width: 16),

        // Cột chứa thông tin (bọc trong Expanded để tránh tràn)
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Giữ chiều cao nhỏ nhất có thể
              children: [
                Text(
                  card["name"]!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.white70, size: 16),
                    SizedBox(width: 6),
                    Text(
                      card["phone"]!,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.white, size: 18),
                          SizedBox(width: 6),
                          Text(
                            card["time"]!,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded( // Để tránh text bị tràn
                            child: Text(
                              "- ${card["room"]}",
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        card["date"]!,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

