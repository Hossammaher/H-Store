import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/Widgets/CustomCardWidget.dart';
import 'package:h_store/cubit/products_cubit/products_cubit.dart';
import 'package:h_store/models/productModel.dart';

class ProductsListview extends StatelessWidget {
  final List<Products> result ;
  const ProductsListview({
    super.key, required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: result.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 0,
          mainAxisSpacing: 20),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return  CustomCardWidget(product: result[index],);
      },
    );
  }
}