import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/Screens/HomeScreenBody.dart';
import 'package:h_store/Widgets/ProductListviewBulider.dart';
import 'package:h_store/Widgets/ProductsListview.dart';
import 'package:h_store/cubit/products_cubit/products_cubit.dart';

class categoryData extends StatelessWidget {
  final String category;
  const categoryData({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: ProductListviewBulider(
        category: category,
      ),
    );
  }
}
