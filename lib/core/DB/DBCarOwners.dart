import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/carOwner.dart';
import 'package:sqflite/sqflite.dart';

class DBCarOwner {
  static Future<void> insertCarOwner(CarOwner carOwner) async {
    final dbClient = await SqlDb().db;
    await dbClient!.insert('Car_Owner', carOwner.toMap());
  }

  static Future<List<CarOwner>> getAllCarOwners() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Car_Owner');
    return List.generate(maps.length, (i) {
      return CarOwner(
        ownerID: maps[i]['Owner_ID'],
        firstName: maps[i]['First_Name'],
        lastName: maps[i]['Last_Name'],
        natID: maps[i]['Nat_ID'],
        address: maps[i]['Address'],
        paymentPerMonth: maps[i]['Payment_per_month'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

  static Future<void> printAllCarOwnersInfo() async {
    final carOwners = await getAllCarOwners();
    carOwners.forEach((carOwner) {
      print('Owner ID: ${carOwner.ownerID}');
      print('First Name: ${carOwner.firstName}');
      print('Last Name: ${carOwner.lastName}');
      print('Nat ID: ${carOwner.natID}');
      print('Address: ${carOwner.address}');
      print('Payment per month: ${carOwner.paymentPerMonth}');
      print('Email: ${carOwner.email}');
      print('Password: ${carOwner.password}\n');
    });
  }

  static Future<bool> isEmailFound(String email) async {
    final dbClient = await SqlDb().db;
    final count = Sqflite.firstIntValue(await dbClient!.rawQuery(
      'SELECT COUNT(*) FROM Car_Owner WHERE email = ?',
      [email],
    ));
    return count! > 0;
  }

  static Future<bool> isNatIdFound(String natId) async {
    final dbClient = await SqlDb().db;
    final count = Sqflite.firstIntValue(await dbClient!.rawQuery(
      'SELECT COUNT(*) FROM Car_Owner WHERE Nat_ID = ?',
      [natId],
    ));
    return count! > 0;
  }

  static Future<CarOwner?> getCarOwnerByEmail(String email) async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(
      'Car_Owner',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return CarOwner(
        ownerID: maps[0]['Owner_ID'],
        firstName: maps[0]['First_Name'],
        lastName: maps[0]['Last_Name'],
        natID: maps[0]['Nat_ID'],
        address: maps[0]['Address'],
        paymentPerMonth: maps[0]['Payment_per_month'],
        email: maps[0]['email'],
        password: maps[0]['password'],
      );
    } else {
      return null; // Car owner not found
    }
  }
}
