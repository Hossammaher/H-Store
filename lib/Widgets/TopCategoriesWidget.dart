import 'package:flutter/material.dart';
import 'package:h_store/Screens/categoryViewScreen.dart';
import 'package:h_store/models/CategoryModel.dart';



class TopCategoriesWidget extends StatelessWidget {
   TopCategoriesWidget({
    super.key,
  });

 final List<CategoryModel> Categories = const [

   CategoryModel(category_name: "womens-dresses", image: 'assets/x.png'),
   CategoryModel(category_name: "womens-shoes",image: 'assets/x.png'),
   CategoryModel(category_name: "mens-shirts", image: 'assets/x.png'),
   CategoryModel(category_name: "mens-shoes", image: 'assets/x.png'),
   CategoryModel(category_name: "mens-watches",image: 'assets/x.png'),
   CategoryModel(category_name: "womens-watches", image: 'assets/x.png'),
   CategoryModel(category_name: "mens-watches", image: 'assets/x.png'),
   CategoryModel(category_name: "womens-jewellery", image: 'assets/x.png'),
   CategoryModel(category_name: "sunglasses", image: 'assets/x.png'),
   CategoryModel(category_name: "laptops", image: 'assets/x.png'),


 ];


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            // height: 60 * 2,
            width: MediaQuery.sizeOf(context).width,
            child: categoryListview(Categories: Categories),
          ),
        )
      ],
    );
  }
}

class categoryListview extends StatelessWidget {
  const categoryListview({
    super.key,
    required this.Categories,

  });

  final List<CategoryModel> Categories;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     physics: const BouncingScrollPhysics(),
      itemCount: Categories.length,
      itemBuilder: (context, index) {
        return  GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return categoryData(category:Categories[index].category_name ,);
            },));
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(Categories[index].image),
                  backgroundColor: Colors.blue,
                  radius: 40,
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(Categories[index].category_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}