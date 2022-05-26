import 'package:flutter/material.dart';
import 'package:fourth_day/provider/category_provider.dart';
import 'package:fourth_day/screens/details_screen.dart';
import 'package:fourth_day/screens/home_page.dart';
import 'package:fourth_day/widgets/single_category_food.dart';
import 'package:provider/provider.dart';

class categoryPage extends StatelessWidget {
  // const categoryPage({Key? key}) : super(key: key);
  

  late MyCategoryFoodItemProvider myCategoryFoodItemProvider;


   Widget _buildCategoryProduct(context) {
    myCategoryFoodItemProvider = Provider.of(context);

    return Container(
      // height: 500,
      color: Color(0xff3e6a89),
      height: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            // height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 50),
                    height: 600,
                    
                    // width: 950,
                    // width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: myCategoryFoodItemProvider.getcategoryFoodItemModelList.length,
                      itemBuilder: (ctx, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => DetailScreen(
                                      foodId: myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].foodId,
                                      foodName:  myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].foodTitle,
                                      foodTitle:  myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].foodSubtitle,
                                      image:  myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].foodImage,
                                      price: myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].price )));
                        },
                        child:SingleCategoryItem(
                          context:context, 
                          foodId:  myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].foodId,
                          foodName:  myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].foodTitle,
                          foodTitle:  myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].foodSubtitle,
                          image:  myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].foodImage,
                          price:  myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].price,
                          rating:  myCategoryFoodItemProvider.getcategoryFoodItemModelList[index].rating)
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0.0,
        backgroundColor:  Color(0xFF005073),
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

        child: _buildCategoryProduct(context)
        ),
      // body: ListView(
      //   children: [
      //     Column(
      //   children: [
      //     _buildSingleCategoryItem(context),
      //     _buildSingleCategoryItem(context),
      //     _buildSingleCategoryItem(context),
      //   ],
      // )
      //   ],
      // )
      );
  }
}
