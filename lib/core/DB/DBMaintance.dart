import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/maintance.dart';

class DBMaintance {
  // Insert a new maintenance record
  Future<int> insertMaintenance(Maintenance maintenance) async {
    final dbClient = await SqlDb().db;
    return await dbClient!.insert('Maintenance', maintenance.toMap());
  }

  // Get all maintenance records
  Future<List<Maintenance>> getMaintenances() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Maintenance');
    return List.generate(maps.length, (i) {
      return Maintenance(
        startDate: maps[i]['Start_date'],
        endDate: maps[i]['End_Date'],
        cost: maps[i]['Cost'],
        description: maps[i]['Description'],
        maintenanceID: maps[i]['Maintenace_ID'],
        carID: maps[i]['Car_ID'],
      );
    });
  }

  // Print all maintenance records
  Future<void> printAllMaintenance() async {
    final List<Maintenance> maintenances = await getMaintenances();

    if (maintenances.isEmpty) {
      print('No maintenance records found.');
    } else {
      print('List of Maintenance Records:');
      for (final maintenance in maintenances) {
        print('Maintenance ID: ${maintenance.maintenanceID}');
        print('Start Date: ${maintenance.startDate}');
        print('End Date: ${maintenance.endDate}');
        print('Cost: ${maintenance.cost}');
        print('Description: ${maintenance.description}');
        print('Car ID: ${maintenance.carID}');
        print('------------------------');
      }
    }
  }

}