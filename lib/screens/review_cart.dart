import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fourth_day/config/colors.dart';
import 'package:fourth_day/model/review_cart_model.dart';
import 'package:fourth_day/provider/myprovider.dart';
import 'package:fourth_day/provider/review_cart_provider.dart';
import 'package:fourth_day/screens/checkout.dart';
import 'package:fourth_day/screens/home_page.dart';
import 'package:fourth_day/screens/order_page.dart';
import 'package:fourth_day/widgets/single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;
  List<num> totalPrice = [];

  num sum = 0;
  int _counter = 0;
  Future gett(item) async {
    num counter = 0;
    totalPrice.add(int.parse(item));
    totalPrice.forEach((element) => counter += element);
    print('list $counter');
    return counter;
  }

  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Cart Item"),
      content: Text("Do You Really want to delete this item ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // MyProvider provider = Provider.of(context);
    // provider.getCartFood();
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    num cartPrice = reviewCartProvider.totalPrice();

    return Scaffold(
      backgroundColor: Color(0xffd8dfe7),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount",style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(
          "\$ $cartPrice",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w900
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Order Now",style: TextStyle(color: Colors.white),),
            color: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            onPressed: () async {
              var collection =
                  FirebaseFirestore.instance.collection('YourReviewCart');
              var snapshots = await collection.get();
              for (var doc in snapshots.docs) {
                await doc.reference.delete();
              }
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => orderPage()));
            },
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomePage()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            )),
        title: Text(
          "Review Cart",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text("NO DATA"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                totalPrice.add(data.price);
                reviewCartProvider.getDeleteIndex(data.cartId);
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      productImage: data.image,
                      productName: data.name,
                      productPrice: data.price,
                      productId: data.cartId,
                      productQuantity: data.quantity,
                      //  onDelete: showAlertDialog(context, data),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

// ListView.builder(

//           itemCount: reviewCartProvider.getReviewCartDataList.length,
//           itemBuilder: (context, index) {
//             ReviewCartModel data =
//         reviewCartProvider.getReviewCartDataList[index];
//             return Container(
//              height: 100,
//              width: 100,
//              color: Colors.red,
//             );
//           },
//         ),

//  Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       SingleItem(
//                         isBool: true,
//                         productImage: data.image,
//                         productName: data.name,
//                         productPrice: data.price,
//                         productId: data.cartId,
//                         productQuantity: data.quantity,
//                       ),
//                     ],
//                   ),
