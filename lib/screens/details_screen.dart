import 'package:flutter/material.dart';
import 'package:fourth_day/provider/myprovider.dart';
import 'package:fourth_day/provider/review_cart_provider.dart';
import 'package:fourth_day/screens/checkout.dart';
import 'package:fourth_day/screens/home_page.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  late final String foodId, image, foodName, foodTitle;
  late final num price;
  DetailScreen(
      {
      required this.foodId,
      required this.price,
      required this.foodTitle,
      required this.image,
      required this.foodName});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Widget _buildSingleDetailText({
    context,
    required String title,
    required String subTitle,
    required String trailingTtitle,
    required String trailingSubTtitle,
  }) {
    MyProvider provider = Provider.of(context);
    return Container(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              Text(trailingTtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subTitle,
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w900)),
              Text(trailingSubTtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  int counter = 1;
  late num totalPrice;
 
  late num quantity = 1;
  @override
  Widget build(BuildContext context) {
    
    setState(() {
      totalPrice = widget.price * counter;
    });
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Color(0xffd8dfe7),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff005073),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomePage()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    color:Color(0xff3e6a89),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    color: Color(0xffd8dfe7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 130,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.foodName,
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          widget.foodTitle,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${totalPrice.toStringAsFixed(1)}",
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Color(0xff8ca3b7),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                counter++;
                                                quantity++;
                                              });
                                            },
                                            child: Icon(
                                              Icons.add,
                                              size: 30,
                                              color:
                                                  Theme.of(context).accentColor,
                                            )),
                                        Text(counter.toString(),
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w900)),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (counter > 1) {
                                                  counter--;
                                                  quantity--;
                                                }
                                              });
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              size: 30,
                                              color:
                                                  Theme.of(context).accentColor,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        _buildSingleDetailText(
                            context: context,
                            title: "Weight",
                            subTitle: "120kg",
                            trailingTtitle: "Mix together",
                            trailingSubTtitle: "Onion, Tomato, Dip"),
                        _buildSingleDetailText(
                            context: context,
                            title: "Colories",
                            subTitle: "420 ccal",
                            trailingTtitle: "Ingredients in this",
                            trailingSubTtitle: "Mixture"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                 Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => CheckOut(
                  foodName: widget.foodName,
                  foodId: widget.foodId,
                  foodTitle: widget.foodTitle,
                  price: totalPrice,
                  quantity: quantity,
                  image: widget.image,
                )));
                              },
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "CheckOut",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {
                                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> (image: widget.image, name: widget.foodName, price: widget.price, quantity: )
                                // )
                                // );
                                reviewCartProvider.addReviewData(
                                    cartId: widget.foodId,
                                    image: widget.image,
                                    name: widget.foodName,
                                    price: totalPrice,
                                    quantity: quantity);
                              },
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              left: 100,
              child: Image(
                  height: 250, width: 230, image: NetworkImage(widget.image)),
            )
          ],
        ),
      ),
    );
  }
}
