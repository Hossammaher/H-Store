import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/Screens/DetailsScreen.dart';
import 'package:h_store/cubit/all_product_cubit/all_product_cubit.dart';
import 'package:h_store/models/productModel.dart';

class customSearch extends SearchDelegate {
  List? filterList;
  late Products products ;



  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return DetailsScreen(product: products);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return BlocBuilder<AllProductCubit, AllProductState>(
        builder: (context, state) {
          if (state is AllProductSuccess) {
            return ListView.builder(
                itemCount:state.results.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.results[index].title.toString()),
                    onTap: () {
                      query=state.results[index].title.toString();
                      products = state.results[index];
                      showResults(context);
                    },
                  );
                }
            );
          } else {
            return Text("no data");
          }
        },
      );
    }  else{

      return BlocBuilder<AllProductCubit, AllProductState>(
        builder: (context, state) {
          if (state is AllProductSuccess) {
            filterList = state.results.where((element) => element.title!.startsWith(query)).toList();
            return ListView.builder(
              itemCount: filterList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filterList![index].title.toString()),
                  onTap: () {
                    query=filterList![index].title.toString();
                    products = filterList![index];
                    showResults(context);
                  },
                );

              },
            );
          } else {
            return Text("no data");
          }
        },
      );
    }


  }
}