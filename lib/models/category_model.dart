import 'package:flutter/material.dart';

class CategoryData {
  String categoryId;
  String categoryTitle;
  Color categoryBackgroundColor;
  String categoryImage;

  CategoryData({
    required this.categoryId,
    required this.categoryTitle,
    required this.categoryBackgroundColor,
    required this.categoryImage,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      categoryId: json[""],
      categoryTitle: json[""],
      categoryBackgroundColor: json[""],
      categoryImage: json[""],
    );
  }
}
