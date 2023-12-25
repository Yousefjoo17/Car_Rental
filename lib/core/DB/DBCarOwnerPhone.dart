import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/carOwnerPhone.dart';

class DBCarOwnerPhone {
  
}Future<void> insertCarOwnerPhone(CarOwnerPhone carOwnerPhone) async {
    final dbClient = await SqlDb().db;
    await dbClient!.insert('Car_Owner_Phone', carOwnerPhone.toMap());
  }

  Future<List<CarOwnerPhone>> getAllCarOwnerPhones() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Car_Owner_Phone');
    return List.generate(maps.length, (i) {
      return CarOwnerPhone(
        phone: maps[i]['Phone'],
        ownerID: maps[i]['Owner_ID'],
      );
    });
  }

  Future<void> printAllCarOwnerPhonesInfo() async {
    final carOwnerPhones = await getAllCarOwnerPhones();
    carOwnerPhones.forEach((carOwnerPhone) {
      print('Phone: ${carOwnerPhone.phone}');
      print('Owner ID: ${carOwnerPhone.ownerID}\n');
    });
  }