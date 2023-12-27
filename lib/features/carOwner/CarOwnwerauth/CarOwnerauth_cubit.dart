import 'package:bloc/bloc.dart';
import 'package:carrental/core/DB/DBTables.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'CarOwnerauth_state.dart';

class CarOwnerAuthCubit extends Cubit<CarOwnwerauthState> {
  CarOwnerAuthCubit() : super(CarOwnwerauthInitial());

  Future<bool> isUserFound(String email, String password) async {
    emit(CarOwnwerauthLoading());
    final dbClient = await SqlDb().db;
    final count = Sqflite.firstIntValue(await dbClient!.rawQuery(
      'SELECT COUNT(*) FROM Car_Owner WHERE email = ? AND password = ?',
      [email, password],
    ));
    emit(CarOwnwerauthSuccess());
    return count! > 0;
  }

  Future<bool> isEmailFound(String email) async {
    final dbClient = await SqlDb().db;
    final count = Sqflite.firstIntValue(await dbClient!.rawQuery(
      'SELECT COUNT(*) FROM Car_Owner WHERE email = ?',
      [email],
    ));
    return count! > 0;
  }

  Future<bool> isNatIdFound(String natId) async {
    final dbClient = await SqlDb().db;
    final count = Sqflite.firstIntValue(await dbClient!.rawQuery(
      'SELECT COUNT(*) FROM Car_Owner WHERE Nat_ID = ?',
      [natId],
    ));
    return count! > 0;
  }
}
