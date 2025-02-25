import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Trạng thái của NotificationCubit
abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<String> notifications;

  const NotificationLoaded(this.notifications);

  @override
  List<Object?> get props => [notifications];
}

class NotificationError extends NotificationState {
  final String message;

  const NotificationError(this.message);

  @override
  List<Object?> get props => [message];
}

/// NotificationCubit chịu trách nhiệm load dữ liệu thông báo
class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial()) {
    loadNotifications();
  }

  /// Phương thức để tải thông báo
  void loadNotifications() async {
    emit(NotificationLoading()); // Chuyển sang trạng thái loading

    try {
      // Mô phỏng việc gọi API hoặc lấy dữ liệu từ cơ sở dữ liệu
      await Future.delayed(const Duration(seconds: 2)); // Giả lập độ trễ

      // Giả lập dữ liệu thông báo (thay bằng API thực tế nếu có)
      final notifications = [
        "Thông báo 1: Hãy kiểm tra lịch hẹn của bạn!",
        "Thông báo 2: Hệ thống sẽ bảo trì vào 22:00 tối nay.",
        "Thông báo 3: Bạn có tin nhắn mới từ bệnh nhân."
      ];

      emit(NotificationLoaded(notifications)); // Trạng thái đã tải xong
    } catch (e) {
      emit(const NotificationError(
          "Không thể tải thông báo. Vui lòng thử lại.")); // Lỗi
    }
  }
}
