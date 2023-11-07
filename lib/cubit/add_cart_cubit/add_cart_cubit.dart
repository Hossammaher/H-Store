import 'package:bloc/bloc.dart';
import 'package:h_store/models/productModel.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'add_cart_state.dart';

class AddCartCubit extends Cubit<AddCartState> {
  AddCartCubit() : super(AddCartInitial());

  CollectionReference carts = FirebaseFirestore.instance.collection('carts');

  void addToCart(Products product) {
    carts.add({
      'id': product.id,
      'name': product.title,
      'price': product.price,
      'rating': product.rating,
      'category': product.category,
      'thumbnail': product.thumbnail,
      'images': product.images,
    });
  }


}
