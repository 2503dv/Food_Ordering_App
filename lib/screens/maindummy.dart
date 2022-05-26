//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fourth_day/provider/myprovider.dart';
import 'package:fourth_day/screens/cart_page.dart';
import 'package:fourth_day/screens/checkout.dart';
import 'package:fourth_day/screens/details_screen.dart';
import 'package:fourth_day/screens/home_page.dart';
// import 'package:fourth_day/screens/login_page.dart';
// import 'package:fourth_day/screens/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fourth_day/screens/profile.dart';
import 'package:fourth_day/screens/skip_screen.dart';
import 'package:fourth_day/screens/welcome_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (ctx) => MyProvider(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
            actionTextColor: Colors.white,
            backgroundColor: Colors.pink,
          ),
          primarySwatch: Colors.pink,
          accentColor: Color(0xff0405ee),
        ),
        // home: WelcomePage(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
            } else {
              // return WelcomePage();
              // return HomePage();
              return HomePage();
            }
          },
        ),
        // home: HomePage(),
      ),
    );
  }
}
