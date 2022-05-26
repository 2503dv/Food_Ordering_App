import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fourth_day/model/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewData(
      {required String cartId,
      required String image,
      required String name,
      required num price,
      required num quantity}) async {
    var uid2 = FirebaseAuth.instance.currentUser?.uid;
    await FirebaseFirestore.instance
        .collection("YourReviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartName": name,
      "cartImage": image,
      "cartPrice": price,
      "cartQuantity": quantity
    });
  }

  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    var uid2 = FirebaseAuth.instance.currentUser?.uid;
    QuerySnapshot reviewCartValue =
        await FirebaseFirestore.instance.collection("YourReviewCart").get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
          cartId: element.get("cartId"),
          image: element.get("cartImage"),
          name: element.get("cartName"),
          price: element.get("cartPrice"),
          quantity: element.get("cartQuantity"));

      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    //  print("length is ");
    //   print(newList.length);
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }

  reviewCartDataDelete(cartId) async {
    FirebaseFirestore.instance
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
    print(cartId);
  }

  late String deleteIndex;
  void getDeleteIndex(String index) {
    deleteIndex = index;
  }

  void delete() {
    FirebaseFirestore.instance
        .collection("YourReviewCart")
        .doc(deleteIndex)
        .delete();
    notifyListeners();
  }

  num totalPrice() {
    num total = 0;
    reviewCartDataList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }
}
