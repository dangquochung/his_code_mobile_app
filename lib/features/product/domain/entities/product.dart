import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String title;
  final String imagePath;
  final String description;

  const Product({
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  List<Object> get props => [title, imagePath, description];
}