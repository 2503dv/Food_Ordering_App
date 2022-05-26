import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fourth_day/screens/welcome_page.dart';

class skipScreen extends StatelessWidget {
  const skipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Container(
              height: double.infinity,
              child: Carousel(
                animationDuration: Duration(seconds: 2),
                autoplay: true,
                boxFit: BoxFit.cover,
                dotBgColor: Colors.transparent,
                dotIncreasedColor: Theme.of(context).primaryColor,
                dotSize: 10,
                images: [
                  NetworkImage("https://i.pinimg.com/originals/8d/fb/43/8dfb43407c406346d2dc29ef47171636.png"),
                  NetworkImage("https://img0.etsystatic.com/043/0/9379571/il_570xN.619332836_d9yx.jpg"),
                  NetworkImage("https://getwallpapers.com/wallpaper/full/4/8/c/789681-top-funny-quote-wallpapers-1080x1920-large-resolution.jpg"),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => WelcomePage()));
                },
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
