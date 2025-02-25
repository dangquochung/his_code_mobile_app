import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileService {
  static const String _fileName = 'data_offline.json';

  // Lấy đường dẫn tới file JSON
  static Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    print('File saved at: ${directory.path}/$_fileName'); 
    return File('${directory.path}/$_fileName');
  }

  // Lưu dữ liệu JSON vào file
  static Future<void> saveJsonToFile(List<dynamic> jsonData) async {
    try {
      final file = await _getFile();
      print('Saving JSON data: ${jsonEncode(jsonData)}');
      await file.writeAsString(jsonEncode(jsonData), flush: true);
    } catch (e) {
      print('Error saving JSON to file: $e');
    }
  }

  // Đọc dữ liệu JSON từ file
  static Future<List<dynamic>?> readJsonFromFile() async {
    try {
      final file = await _getFile();
      if (await file.exists()) {
        final contents = await file.readAsString();
        return jsonDecode(contents);
      }
    } catch (e) {
      print('Error reading JSON from file: $e');
    }
    return null;
  }
}