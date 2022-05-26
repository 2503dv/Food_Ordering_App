import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:fourth_day/model/category_food_item_model.dart';

import 'package:fourth_day/model/feature_model.dart';

class MyCategoryFoodItemProvider with ChangeNotifier {
 

  List< CategoryFoodItemModel> categoryFoodItemModelList = [];
  late  CategoryFoodItemModel categoryModelModel;
  Future<void> getCategoryItemFood(name) async {
    List< CategoryFoodItemModel> list = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(name).get();
    querySnapshot.docs.forEach((name) {
      categoryModelModel =  CategoryFoodItemModel(
        foodId: name.get('foodId'),
        foodImage: name.get('image'),
        foodSubtitle: name.get('foodSubTitle'),
        foodTitle: name.get('foodTitle'),
        price: name.get('price'),
        rating: name.get('rating'),
      );
      list.add(categoryModelModel);
    });
    categoryFoodItemModelList = list;
    notifyListeners();
  }

  List< CategoryFoodItemModel> get getcategoryFoodItemModelList {
    return categoryFoodItemModelList;
  }











  

  
}
