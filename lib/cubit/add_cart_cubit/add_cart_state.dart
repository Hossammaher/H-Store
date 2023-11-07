part of 'add_cart_cubit.dart';

@immutable
abstract class AddCartState {}

class AddCartInitial extends AddCartState {}
class AddCartLoading extends AddCartState {}
class AddCartSuccess extends AddCartState {

  List<Products> results ;

  AddCartSuccess(this.results);
}
class AddCartFailure extends AddCartState {

  final String errMessage ;

  AddCartFailure(this.errMessage);
}