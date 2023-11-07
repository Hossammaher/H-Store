import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/CustomSearch.dart';
import 'package:h_store/Screens/HomeScreen.dart';
import 'package:h_store/Widgets/AllProductsListviewBuilder.dart';
import 'package:h_store/Widgets/ProductListviewBulider.dart';
import 'package:h_store/Widgets/ProductsListview.dart';
import 'package:h_store/Widgets/TopCategoriesWidget.dart';
import 'package:h_store/cubit/all_product_cubit/all_product_cubit.dart';
import 'package:h_store/cubit/products_cubit/products_cubit.dart';


class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   "Top Categories",
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // TopCategoriesWidget(),
              // const SizedBox(
              //   height: 10,
              // ),
              // const Text(
              //   "Recent View",
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
               Expanded(
                child: AllProductsListviewBuilder(),
              ),

            ],
          ),
          Positioned(
              right: 10,
              bottom: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
            showSearch(context: context, delegate: customSearch());
          },child: const Icon(Icons.search,color: Colors.black,),))
        ],

      ),
    );
  }
}





