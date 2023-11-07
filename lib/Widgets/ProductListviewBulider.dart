import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/Widgets/CustomCardWidget.dart';
import 'package:h_store/Widgets/ProductsListview.dart';
import 'package:h_store/cubit/products_cubit/products_cubit.dart';
import 'package:h_store/models/CategoryModel.dart';
import 'package:h_store/models/productModel.dart';

class ProductListviewBulider extends StatefulWidget {

  final String category ;
  const ProductListviewBulider({
    super.key,  required this.category
  });

  @override
  State<ProductListviewBulider> createState() => _ProductListviewBuliderState();
}

class _ProductListviewBuliderState extends State<ProductListviewBulider> {


  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getCategoryProducts(widget.category);

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          List<Products> result = state.results ;
          return ProductsListview(result: result);
        }
        else if (state is ProductsFailure) {
          return Center(child: Text(state.errMessage));
        }
        else{
          return Center(child: CircularProgressIndicator());
        }

      },
    );
  }
}