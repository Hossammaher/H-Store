import 'package:bloc/bloc.dart';
import 'package:h_store/constant.dart';
import 'package:h_store/models/productModel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'add_fav_state.dart';

class AddFavCubit extends Cubit<AddFavState> {
  AddFavCubit() : super(AddFavInitial());

  addFAv(Products model){

   try {
     var box =  Hive.box<Products>(kHiveBox) ;
     box.add(model);
     emit(AddFavSuccess());
   } on Exception catch (e) {
     emit(AddFavFailure(e.toString()));
   }

  }


}
