import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fourth_day/provider/category_provider.dart';
import 'package:fourth_day/provider/myfeatureprovider.dart';
import 'package:fourth_day/provider/myprovider.dart';
import 'package:fourth_day/provider/myprovider.dart';
import 'package:fourth_day/provider/myprovider.dart';
import 'package:fourth_day/screens/about.dart';
import 'package:fourth_day/screens/category_page.dart';
import 'package:fourth_day/screens/contact.dart';
import 'package:fourth_day/screens/details_screen.dart';
import 'package:fourth_day/screens/login_page.dart';
import 'package:fourth_day/screens/profile.dart';
import 'package:fourth_day/screens/review_cart.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fourth_day/screens/login_page.dart';

class HomePage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);

  Widget _buildSingleFeature(
      {context,
      required String foodId,
      required String foodTitle,
      required String image,
      required String foodSubTitle,
      required num rating,
      required num price}) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            height: 230,
            width: 210,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  foodTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  foodSubTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[600],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        rating.toString() + " Ratings",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$" + price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        CircleAvatar(
          maxRadius: 60,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(image),
        )
      ],
    );
  }

  Widget _buildSingleCategory({required String image, required String name}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 200,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 130,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 100,
                    //  width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTopPart(context) {
    return Expanded(
        child: Container(
          
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      _scaffoldkey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.sort,
                      size: 30,
                      color: Colors.white,
                    )),
                Text(
                  "FunFood",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      size: 30,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Expanded(
            child: Container(
                child: Column(
              children: [
                Container(
                  height: 120,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        
                        maxRadius: 40,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          maxRadius: 35,
                          
                          backgroundImage: AssetImage('images/img5.png'),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 200,
                        child: ListTile(
                          title: Text(
                            "Why block your ",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "hunger? 😉",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
          )
        ],
      ),
      color:   Color(0xFF005073),
    ));
  }

  late MyCategoryFoodItemProvider myCategoryFoodItemProvider;

  Widget _buildCategoryPart(context) {
    myCategoryFoodItemProvider = Provider.of(context);
    return Container(
      width: double.infinity,
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: myProvider.getcategoryModelList.length,
              itemBuilder: (ctx, index) => GestureDetector(
                onTap: () {
                  myCategoryFoodItemProvider.getCategoryItemFood(
                      myProvider.getcategoryModelList[index].name);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => categoryPage(
                        
                      )));
                },
                child: _buildSingleCategory(
                  image: myProvider.getcategoryModelList[index].image,
                  name: myProvider.getcategoryModelList[index].name,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  late MyProvider myProvider;

  Widget _buildFeatureProduct(context) {
    return Container(
      height: 250,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 220,
                    // width: 950,
                    // width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myProvider.getfeatureModelList.length,
                      itemBuilder: (ctx, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => DetailScreen(
                                      foodId: myProvider
                                          .getfeatureModelList[index].foodId,
                                      foodName: myProvider
                                          .getfeatureModelList[index].foodTitle,
                                      foodTitle: myProvider
                                          .getfeatureModelList[index]
                                          .foodSubtitle,
                                      image: myProvider
                                          .getfeatureModelList[index].foodImage,
                                      price: myProvider
                                          .getfeatureModelList[index].price)));
                        },
                        child: _buildSingleFeature(
                            context: context,
                            foodId:
                                myProvider.getfeatureModelList[index].foodId,
                            foodTitle:
                                myProvider.getfeatureModelList[index].foodTitle,
                            image:
                                myProvider.getfeatureModelList[index].foodImage,
                            foodSubTitle: myProvider
                                .getfeatureModelList[index].foodSubtitle,
                            rating:
                                myProvider.getfeatureModelList[index].rating,
                            price: myProvider.getfeatureModelList[index].price),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart(context) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Color(0xffd8dfe7),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildCategoryPart(context),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                _buildFeatureProduct(context),
              ],
            ),
          ),
        ));
  }

  Widget _buildMyDrawer(context) {
    return ListView(
      
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xFF005073)
          ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/img7.png"),
            ),
            accountName: Text("Karja re Karja re,",style: TextStyle(fontSize: 16,color: Colors.white),),
            accountEmail: Text("Aaj toh ek order 🙄",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
        ListTile(
           onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => HomePage()));
          },
          leading: Icon(
            Icons.home,
            color:Color(0xFF005073),
          ),
          title: Text("HomePage",style: TextStyle(fontSize: 16,color: Color(0xFF005073)),),
        ),
        ListTile(
           onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => ProfileScreen()));
          },
          leading: Icon(
            Icons.person,
            color:Color(0xFF005073),
          ),
          title: Text("Profile",style: TextStyle(fontSize: 16,color: Color(0xFF005073)),),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => ReviewCart()));
          },
          leading: Icon(
            Icons.shopping_cart_outlined,
            color: Color(0xFF005073),
          ),
          title: Text("Cart",style: TextStyle(fontSize: 16,color: Color(0xFF005073)),),
        ),
        Divider(
          // height: 8,
          color: Colors.blueGrey,
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => contact()));
          },
          leading: Icon(
            Icons.contact_phone_outlined,
            color: Color(0xFF005073),
          ),
          title: Text("Contact Us",style: TextStyle(fontSize: 16,color: Color(0xFF005073)),),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (ctx) => About()));
          },
          leading: Icon(
            Icons.info,
            color: Color(0xFF005073),
          ),
          title: Text("About Us",style: TextStyle(fontSize: 16,color: Color(0xFF005073)),),
        ),
       
        ListTile(
             onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
          leading: Icon(
            Icons.logout,
            color: Color(0xFF005073),
          ),
          title: Text("Log Out",style: TextStyle(fontSize: 16,color: Color(0xFF005073)),),
        ),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    myProvider = Provider.of<MyProvider>(context);
    myProvider.getCategoryProduct();
    myProvider.getFeatureFood();
    return Scaffold(
      key: _scaffoldkey,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xffd8dfe7)
        ),
              child: Drawer(
          
          child: _buildMyDrawer(context),
        ),
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            _buildTopPart(context),
            _buildBottomPart(context),
          ],
        ),
      )),
    );
  }
}

//  appBar: AppBar(
//         actions: [
//           IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size: 30,)),
//           IconButton(
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//                   Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Login()));
//               },
//               icon: Icon(Icons.exit_to_app))
//         ],
//         title: Text("FunFood"),
//       ),
