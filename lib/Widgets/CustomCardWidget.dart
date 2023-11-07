import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/Screens/DetailsScreen.dart';
import 'package:h_store/constant.dart';
import 'package:h_store/cubit/add_favourite_cubit/add_fav_cubit.dart';
import 'package:h_store/cubit/show_favourite_cubit/show_fav_cubit.dart';
import 'package:h_store/models/productModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomCardWidget extends StatefulWidget {
  final Products product;
  bool isFavorite = false;

  CustomCardWidget({
    super.key,
    required this.product,
  });

  @override
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  IconData? icon;


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DetailsScreen(
                product: widget.product,
              );
            },
          ));
        },
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    widget.product.thumbnail!,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.product.title.toString()),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(widget.product.rating.toString()),
                        const Icon(
                          Icons.star_outlined,
                          size: 16,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                    Text(" ${widget.product.price} \$"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      Positioned(
        top: 10,
        right: 10,
        child: IconButton(
            onPressed: () {
              toggleFavorite();
            },
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.red,
            )),
      )
    ]);
  }

  toggleFavorite() async {
    final favoriteBox = await Hive.openBox<Products>(kHiveBox);
    final itemIndex = favoriteBox.values
        .toList()
        .indexWhere((item) => item.id == widget.product.id);

    if (itemIndex >= 0) {
      // Item is already in favorites, delete it
      favoriteBox.deleteAt(itemIndex);
      var snackBar = const SnackBar(content: Text("Delete from FAV"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        widget.isFavorite = false;
        BlocProvider.of<ShowFavCubit>(context).showFav();
      });
    } else {
      // Item is not in favorites, add it
      BlocProvider.of<AddFavCubit>(context).addFAv(widget.product);
      setState(() {
        widget.isFavorite = true;
        BlocProvider.of<ShowFavCubit>(context).showFav();
        var snackBar = const SnackBar(content: Text("Add to FAV"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }
  }
}
