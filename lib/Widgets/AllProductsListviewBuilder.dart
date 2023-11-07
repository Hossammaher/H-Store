import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/Widgets/ProductsListview.dart';
import 'package:h_store/cubit/all_product_cubit/all_product_cubit.dart';

class AllProductsListviewBuilder extends StatelessWidget {
  const AllProductsListviewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductCubit,AllProductState>(builder: (context, state) {
      if (state is AllProductSuccess ) {
        return ProductsListview(result: state.results);
      }
      else if (state is AllProductFailure) {
        return Center(child: Text(state.errMessge));
      }
      else{
        return const Center(child: CircularProgressIndicator());
      }

    }
      ,);
  }
}