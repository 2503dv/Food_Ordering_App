import 'package:flutter/material.dart';
// import 'package:food_delivery/screens/login_page.dart';
// import 'package:food_delivery/screens/sign_up.dart';
import 'package:fourth_day/screens/login_page.dart';
import 'package:fourth_day/screens/sign_up.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  Widget button(
      {required String name, required Color color, required Color textcolor}) {
    return Container(
        width: 300,
        height: 45,
        child: RaisedButton(
          color: color,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFF00BFA6), width: 2),
              borderRadius: BorderRadius.circular(30)),
          onPressed: () {},
          child: Text(
            name,
            style: TextStyle(
              color: textcolor,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF284262),
      // backgroundColor: Color(0xFF005073),

      body: Column(
        children: [
          Expanded(
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: Image.network("https://cdn.mageplaza.com/media/general/UqEUWGU.png")
              // child: NetworkImage("https://www.touchbistro.com/wp-content/uploads/2018/12/make-upselling-look-like-customer-service-thumbnail.png"),
            ),
          )),
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Welcome To FunFoood",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00BFA6)),
                ),
                Column(
                  children: [
                    Text("Order food from our restaurant and ",style: TextStyle(color: Colors.white,fontSize: 18),),
                    Text("Make reservation in real - time",style: TextStyle(color: Colors.white,fontSize: 18),)
                  ],
                ),
                Container(
                    width: 300,
                    height: 45,
                    child: RaisedButton(
                      color: Color(0xFF00BFA6),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFF00BFA6), width: 2),
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                           fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
                Container(
                    width: 300,
                    height: 45,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFF00BFA6), width: 2),
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00BFA6),
                        ),
                      ),
                    )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
