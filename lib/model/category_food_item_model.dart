import 'package:flutter/material.dart';

class CategoryFoodItemModel {
  final String foodId,foodSubtitle, foodTitle, foodImage;
  final num rating, price;
  CategoryFoodItemModel(
      {
      required this.foodId,
      required this.foodImage,
      required this.foodSubtitle,
      required this.foodTitle,
      required this.price,
      required this.rating});
}
