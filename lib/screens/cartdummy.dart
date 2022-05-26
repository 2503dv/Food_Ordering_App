// import 'package:flutter/material.dart';
// import 'package:fourth_day/provider/myprovider.dart';
// import 'package:fourth_day/screens/home_page.dart';
// import 'package:provider/provider.dart';

// class CartPage extends StatelessWidget {
//   late final String image, name;
//   late final num price,quantity;
//   CartPage(
//       {required this.price,
//       required this.name,
//       required this.image,
//       required this.quantity});

//   Widget CartSingleBox(
//       {context,
//       required String image,
//       required String name,
//       required num price,
//       required num quantity}) {
//     return Container(
//       height: 180,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: 170,
//                 width: 170,
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage(image),
//                 ),
//               ),
//               SizedBox(
//                 width: 20,
//               ),
//               Expanded(
//                   child: Stack(
//                 alignment: Alignment.topRight,
//                 children: [
//                   Container(
//                     height: 200,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           name,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "7 Ocean Star",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                         Text(
//                           "\$"+price.toString(),
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.remove_circle_outline,
//                                   color: Colors.white,
//                                   size: 40,
//                                 )),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               quantity.toString(),
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.add_circle_outline,
//                                   color: Colors.white,
//                                   size: 40,
//                                 ))
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.close,
//                         color: Colors.white,
//                       ))
//                 ],
//               ))
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     MyProvider provider = Provider.of<MyProvider>(context);
//     return Scaffold(
//         backgroundColor: Colors.blueGrey,
//         bottomNavigationBar: Container(
//             margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             height: 65,
//             decoration: BoxDecoration(
//                 color: Color(0xff3a3e3e),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "\$23",
//                   style: TextStyle(color: Colors.white, fontSize: 30),
//                 ),
//                 Text(
//                   "CheckOut",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold),
//                 )
//               ],
//             )),
//         appBar: AppBar(
//           elevation: 0.0,
//           backgroundColor: Color(0xfffef0f7),
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (ctx) => HomePage()));
//               },
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//                 size: 30,
//               )),
//         ),
//         body: ListView.builder(
//           itemCount: provider.cartList.length,
//           itemBuilder: (ctx, index) => 
//             CartSingleBox(
//               image: provider.cartList[index].image,
//               name: provider.cartList[index].name,
//               price: provider.cartList[index].price,
//               quantity: provider.cartList[index].quantity,
//             ),
          
//         )
//         );
//   }
// }
