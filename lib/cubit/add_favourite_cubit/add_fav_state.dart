part of 'add_fav_cubit.dart';

@immutable
abstract class AddFavState {}

class AddFavInitial extends AddFavState {}

class AddFavSuccess extends AddFavState {
}
class AddFavFailure extends AddFavState {
  final errMessage;
  AddFavFailure(this.errMessage);
}
