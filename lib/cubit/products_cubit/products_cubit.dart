import 'package:bloc/bloc.dart';
import 'package:h_store/API/API.dart';
import 'package:h_store/models/productModel.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> getCategoryProducts(categoryName) async {
    emit(ProductsLoading());
    try {
     final result = await API().getProductByCategory(categoryName);
      emit(ProductsSuccess(result));
    } on Exception catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }


}
