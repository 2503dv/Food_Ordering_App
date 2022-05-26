import 'package:flutter/material.dart';
import 'package:fourth_day/screens/home_page.dart';
import 'package:fourth_day/screens/order_page.dart';

class CheckOut extends StatelessWidget {
  // const CheckOut({ Key? key }) : super(key: key);
  final String foodId, image, foodName, foodTitle;
  final num price, quantity;
  CheckOut({
    required this.foodId,
    required this.price,
    required this.foodTitle,
    required this.image,
    required this.foodName,
    required this.quantity,
  });
  @override
  Widget build(BuildContext context) {
    num orderPrice = price + 2.1 + 3.1;
    return Scaffold(
      backgroundColor: Color(0xff6686a0),
      bottomNavigationBar: Container(
        height: 300,
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)

          ),
        color: Theme.of(context).accentColor,

        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Text(
                "Total (${quantity.toString()} items)",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.white),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "\$${price.toStringAsFixed(1)}",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            ListTile(
              leading: Text(
                "+Taxes",
                style: TextStyle(
                    // fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.grey),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "\$2.1",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            ListTile(
              leading: Text(
                "+Delivery Charges",
                style: TextStyle(
                    // fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Colors.grey),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "\$3.1",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            ListTile(
              leading: Text(
                "Total Payable",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.white),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "\$${orderPrice.toStringAsFixed(1)}",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => orderPage()));
              },
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Order",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomePage()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: Color(0xff0c435f),
        title: Text(
          "CheckOut",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                     color: Color(0xffd8dfe7),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(
                        color: Theme.of(context).primaryColor,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      )]
                  ),

                  height: 70,
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(image),
                      ),
                      title: Row(
                        children: [
                          Text("x$quantity"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foodName,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                foodTitle,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "\$${price.toStringAsFixed(1)}",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
