import 'package:bloc/bloc.dart';
import 'package:h_store/constant.dart';
import 'package:h_store/models/productModel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'show_fav_state.dart';

class ShowFavCubit extends Cubit<ShowFavState> {
  ShowFavCubit() : super(ShowFavInitial());

  List<Products> results =[] ;
  showFav(){
    var box = Hive.box<Products>(kHiveBox);
    results = box.values.toList();
    emit(ShowFavSuccess());

  }

}
