import 'package:flutter/material.dart';

class SingleCategoryItem extends StatelessWidget {
  // const SingleCategoryItem({ Key? key }) : super(key: key);
 late final String foodId, image, foodName, foodTitle;
  late final num price,rating;
  SingleCategoryItem(
      {
        context,
      required this.foodId,
      required this.price,
      required this.foodTitle,
      required this.image,
      required this.foodName,
      required this.rating});


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Container(
            
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Color(0xffd8dfe7), borderRadius: BorderRadius.circular(20)),
            height: 230,
            width: 250,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                 foodName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                 foodTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff3e6a89),
                    fontWeight: FontWeight.bold
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange[600],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        rating.toString() + " Ratings",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff3e6a89),
                          fontWeight: FontWeight.bold
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
          maxRadius: 70,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(image),
        )
      ],
    );
  }
}