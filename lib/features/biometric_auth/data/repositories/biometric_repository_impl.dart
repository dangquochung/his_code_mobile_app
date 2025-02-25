import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:vnpt_his/core/error/failures.dart';
import '../../domain/entities/secure_file.dart';
import '../../domain/usecases/authenticate_and_get_pdf.dart';
import '../datasources/biometric_service.dart';

class BiometricRepositoryImpl implements BiometricRepository {
  final BiometricService biometricService;

  BiometricRepositoryImpl({required this.biometricService});

  @override
  Future<Either<Failure, SecureFile>> authenticateAndGetPdf() async {
    final authenticated = await biometricService.authenticate();
    if (!authenticated) {
      return Left(GeneralFailure("Xác thực thất bại"));
    }

    try {
      Directory? directory;

      // Kiểm tra quyền truy cập bộ nhớ
      if (Platform.isAndroid) {
        if (!(await Permission.storage.request().isGranted)) {
          return Left(GeneralFailure("Không có quyền truy cập bộ nhớ trên Android"));
        }
        directory = await getExternalStorageDirectory(); // Android: Bộ nhớ ngoài
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory(); // iOS: Thư mục Documents
      }

      if (directory == null) {
        return Left(GeneralFailure("Không tìm thấy thư mục lưu trữ"));
      }

      final filePath = '${directory.path}/ket_qua_kham.pdf';
      final file = File(filePath);

      // Kiểm tra file PDF đã tồn tại chưa
      if (!(await file.exists())) {
        // Đọc file PDF từ assets
        final byteData = await rootBundle.load('assets/ket_qua_kham.pdf');
        final buffer = byteData.buffer;

        // Ghi file PDF vào bộ nhớ thiết bị
        await file.writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
        print("File PDF đã được sao chép vào: $filePath");
      }

      // Trả về đường dẫn file PDF thật
      return Right(SecureFile(fileName: "ket_qua_kham.pdf", filePath: filePath));
    } catch (e) {
      return Left(GeneralFailure("Lỗi sao chép file PDF: $e"));
    }
  }
}