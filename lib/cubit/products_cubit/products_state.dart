part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class ProductsLoading extends ProductsState {}
class ProductsSuccess extends ProductsState {

  List<Products> results ;

  ProductsSuccess(this.results);
}
class ProductsFailure extends ProductsState {
  String errMessage ;
  ProductsFailure(this.errMessage);
}

