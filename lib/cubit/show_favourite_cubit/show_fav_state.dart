part of 'show_fav_cubit.dart';

@immutable
abstract class ShowFavState {}

class ShowFavInitial extends ShowFavState {}
class ShowFavSuccess extends ShowFavState {}
class ShowFavFailure extends ShowFavState {
  final errMessage;
  ShowFavFailure(this.errMessage);
}
