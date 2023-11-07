import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/Widgets/ProductsListview.dart';
import 'package:h_store/cubit/show_favourite_cubit/show_fav_cubit.dart';
import 'package:h_store/models/productModel.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ShowFavCubit>(context).showFav();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(
          children: [
            Expanded(
              child: BlocBuilder<ShowFavCubit, ShowFavState>(
                builder: (context, state) {
                  List<Products> productList =
                      BlocProvider.of<ShowFavCubit>(context).results ?? [];
                  if (state is ShowFavSuccess) {
                    return ProductsListview(result: productList);

                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ));
  }
}
