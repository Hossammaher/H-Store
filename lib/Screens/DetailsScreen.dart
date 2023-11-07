import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_store/cubit/add_cart_cubit/add_cart_cubit.dart';
import 'package:h_store/models/productModel.dart';

class DetailsScreen extends StatelessWidget {
  final Products product ;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title.toString()),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(product.thumbnail!,
              height: 200,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Product Name  ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              product.title.toString(),
              style: TextStyle(fontSize: 16,),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Prise   ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "${product.price} \$   ",
              style: TextStyle(fontSize: 16, ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Details  ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              product.description.toString(),
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(
              height: 20,
            )
            ,
            Expanded(
              child: ListView.builder(
                itemCount: product.images?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(product.images![index]),
                );

              },),
            ) ,

          ],
        ),
      ),
    );
  }
}
