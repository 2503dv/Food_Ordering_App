// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:flutter/material.dart';
// import 'package:fourth_day/model/category_model.dart';
// import 'package:fourth_day/model/feature_model.dart';
// class MyProvider with ChangeNotifier {
//    List<FeatureModel> featureModelList = [];
//   late FeatureModel featureModelModel;
//   Future<void> getFeatureFood() async {
//     List<FeatureModel> list = [];
//     QuerySnapshot querySnapshot =
//         await FirebaseFirestore.instance.collection("homefeaturefood").get();
//     querySnapshot.docs.forEach((homeFeatureFood) {
//        featureModelModel = FeatureModel(
//         foodImage: homeFeatureFood.get('image'),
//         foodSubtitle: homeFeatureFood.get('foodSubTitle'),
//         foodTitle: homeFeatureFood.get('foodTitle'),
//         price: homeFeatureFood.get('price'),
//         rating: homeFeatureFood.get('rating'),
//       );
//       list.add(featureModelModel);
//     });
//     featureModelList = list;
//      notifyListeners();
//   }

//   List<FeatureModel> get getfeatureModelList {
//     return featureModelList;
//   }
// }
 
