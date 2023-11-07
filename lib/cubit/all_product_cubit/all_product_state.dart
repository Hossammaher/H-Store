part of 'all_product_cubit.dart';

@immutable
abstract class AllProductState {}

class AllProductInitial extends AllProductState {}
class AllProductLoading extends AllProductState {}
class AllProductSuccess extends AllProductState {

  List<Products> results ;

  AllProductSuccess(this.results);
}
class AllProductFailure extends AllProductState {

  String errMessge ;

  AllProductFailure(this.errMessge);
}