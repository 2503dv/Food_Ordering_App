import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:fourth_day/model/cart_model.dart';
import 'package:fourth_day/model/category_model.dart';
import 'package:fourth_day/model/feature_model.dart';

class MyProvider with ChangeNotifier {
  List<CategoryModel> categoryModelList = [];
  late CategoryModel categoryModel;
  Future<void> getCategoryProduct() async {
    List<CategoryModel> list = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("homecategory").get();
    querySnapshot.docs.forEach((categorydata) {
      categoryModel = CategoryModel(
        image: categorydata.get('image'),
        name: categorydata.get('name'),
      );
      list.add(categoryModel);
    });
    categoryModelList = list;
    notifyListeners();
  }

  List<CategoryModel> get getcategoryModelList {
    return categoryModelList;
  }

  List<FeatureModel> featureModelList = [];
  late FeatureModel featureModelModel;
  Future<void> getFeatureFood() async {
    List<FeatureModel> list = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("homefeaturefood").get();
    querySnapshot.docs.forEach((homeFeatureFood) {
      featureModelModel = FeatureModel(
        foodId: homeFeatureFood.get('foodId'),
        foodImage: homeFeatureFood.get('image'),
        foodSubtitle: homeFeatureFood.get('foodSubTitle'),
        foodTitle: homeFeatureFood.get('foodTitle'),
        price: homeFeatureFood.get('price'),
        rating: homeFeatureFood.get('rating'),
      );
      list.add(featureModelModel);
    });
    featureModelList = list;
    notifyListeners();
  }

  List<FeatureModel> get getfeatureModelList {
    return featureModelList;
  }











  ////////////////  Cart Model //////////////
  // List<CartModel> cartList = [];
  // List<CartModel> newCartList = [];

  // late CartModel cartModel;
  // void addToCart(
  //     {required String image,
  //     required String name,
  //     required num price,
  //     required num quantity}) {
  //   cartModel =
  //       CartModel(image: image, name: name, price: price, quantity: quantity);
  //   newCartList.add(cartModel);
  //   cartList = newCartList;
  // }

  // get throwCartList {
  //   return cartList;
  // }

  List<CartModel> cartModelList = [];
  late CartModel cartModelModel;
  Future<void> getCartFood() async {
    List<CartModel> list = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("ReviewCart").get();
    querySnapshot.docs.forEach((element) {
      cartModelModel = CartModel(
        image: element.get('cartImage'),
        cartId: element.get('cartId'),
        name: element.get('cartName'),
        price: element.get('cartPrice'),
        quantity: element.get('cartQuantity'),
      );

      list.add(cartModelModel);
    });
    cartModelList = list;

    notifyListeners();
    print(list.length);
  }

  List<CartModel> get getcartsModelList {
    return cartModelList;
  }
}
