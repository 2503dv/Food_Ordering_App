import 'package:flutter/material.dart';
import 'package:fourth_day/screens/home_page.dart';

class CheckOut extends StatefulWidget {
  // const CheckOut({ Key? key }) : super(key: key);
 late final String foodId, image, foodName, foodTitle;
  late final num price,quantity;
  CheckOut(
      {
      required this.foodId,
      required this.price,
      required this.foodTitle,
      required this.image,
      required this.foodName,
      required this.quantity,
      });
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  Widget _buildCheckOutBox({
    context,
    required String foodId,
    required num price,
    required String foodTitle,
    required String image,
    required String foodName,
    required num quantity
  }){

    return  Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Container(
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
                          Text(
                            "x$quantity"
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foodTitle,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                foodName,
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
                        child: Text("\$$price",style: TextStyle(color: Theme.of(context).accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w900
                        ),
                        
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 250,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Theme.of(context).accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: Text(
                "Total",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
              trailing:  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text("\$50",style: TextStyle(color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w900
                      ),
                      
                      ),
                    ),
                   
            ),
             RaisedButton(
                      onPressed: () {
                       
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
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
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: Text(
          "CheckOut",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:_buildCheckOutBox(
      
        image: widget.image,
        foodId: widget.foodId,
        foodName: widget.foodName,
        foodTitle: widget.foodTitle,
        quantity: widget.quantity,
        price: widget.price,
        ),
    );
  }
}