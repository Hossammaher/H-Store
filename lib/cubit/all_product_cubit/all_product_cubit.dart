import 'package:bloc/bloc.dart';
import 'package:h_store/API/API.dart';
import 'package:h_store/models/productModel.dart';
import 'package:meta/meta.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit() : super(AllProductInitial());


  Future<void> getAllProducts() async {
    emit(AllProductLoading());
    try {
      final result = await API().getProduct();
      emit(AllProductSuccess(result));
    } on Exception catch (e) {
      emit(AllProductFailure(e.toString()));
    }
  }


}
