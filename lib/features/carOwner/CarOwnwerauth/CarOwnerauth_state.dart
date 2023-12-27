part of 'CarOwnerauth_cubit.dart';

@immutable
sealed class CarOwnwerauthState {}

final class CarOwnwerauthInitial extends CarOwnwerauthState {}

final class CarOwnwerauthLoading extends CarOwnwerauthState {}

final class CarOwnwerauthSuccess extends CarOwnwerauthState {}

final class CarOwnwerauthFailure extends CarOwnwerauthState {
  final String errMessage;
  CarOwnwerauthFailure(this.errMessage);
}
