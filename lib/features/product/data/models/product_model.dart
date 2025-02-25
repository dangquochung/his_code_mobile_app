import 'package:vnpt_his/features/product/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.title,
    required super.imagePath,
    required super.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imagePath': imagePath,
      'description': description,
    };
  }
}
