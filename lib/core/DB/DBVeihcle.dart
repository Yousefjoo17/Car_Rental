import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/veihcle.dart';

class DBVehicle {
  static Future<void> insertVehicle(Vehicle vehicle) async {
    final dbClient = await SqlDb().db;
    await dbClient!.insert('Vehicle', vehicle.toMap());
  }
  
  static Future<List<Vehicle>> getAllVehicles() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Vehicle');
    return List.generate(maps.length, (i) {
      return Vehicle(
        carID: maps[i]['Car_ID'],
        availability: maps[i]['Availability'],
        priceToRent: maps[i]['price_to_rent'],
        year: maps[i]['Year'],
        model: maps[i]['Model'],
        noKM: maps[i]['No_KM'],
        color: maps[i]['Color'],
        currentCity: maps[i]['Current_City'],
        registrationInformation: maps[i]['Registration_information'],
        ownerID: maps[i]['Owner_ID'],
      );
    });
  }

  static Future<void> printAllVehiclesInfo() async {
    final vehicles = await getAllVehicles();
    vehicles.forEach((vehicle) {
      print('Car ID: ${vehicle.carID}');
      print('Availability: ${vehicle.availability}');
      print('Price to Rent: ${vehicle.priceToRent}');
      print('Year: ${vehicle.year}');
      print('Model: ${vehicle.model}');
      print('Color: ${vehicle.color}');
      print('Current City: ${vehicle.currentCity}');
      print('Registration Information: ${vehicle.registrationInformation}');
      print('Owner ID: ${vehicle.ownerID}\n');
    });
  }

  static Future<List<String>> getAllCities() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(
      'Vehicle',
      columns: ['Current_City'],
      distinct: true,
    );
    return List.generate(maps.length, (i) => maps[i]['Current_City'] as String);
  }

  static Future<List<String>> getAllModals() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(
      'Vehicle',
      columns: ['Model'],
      distinct: true,
    );
    return List.generate(maps.length, (i) => maps[i]['Model'] as String);
  }

  static Future<List<String>> getAllYears() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(
      'Vehicle',
      columns: ['Year'],
      distinct: true,
    );
    return List.generate(maps.length, (i) => maps[i]['Year'] as String);
  }

  static Future<List<String>> getAllColors() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query(
      'Vehicle',
      columns: ['Color'],
      distinct: true,
    );
    return List.generate(maps.length, (i) => maps[i]['Color'] as String);
  }

  /***********************************************/
  static Future<List<Vehicle>> getVehiclesByCriteria({
    String? city,
    String? year,
    String? modal,
    String? color,
  }) async {
    final dbClient = await SqlDb().db;

    // Build the WHERE clause based on the provided criteria
    String whereClause = '';
    List<dynamic> whereArgs = [];

    // Check if at least one criterion is provided
    if (city != null || year != null || modal != null || color != null) {
      // Check each criterion and add to WHERE clause
      if (city != null && city != 'all          ') {
        whereClause += 'Current_City = ? AND ';
        whereArgs.add(city);
      }

      if (year != null && year != 'all          ') {
        whereClause += 'Year = ? AND ';
        whereArgs.add(year);
      }

      if (modal != null && modal != 'all          ') {
        whereClause += 'Model = ? AND ';
        whereArgs.add(modal);
      }

      if (color != null && color != 'all          ') {
        whereClause += 'Color = ? AND ';
        whereArgs.add(color);
      }

      // Remove the trailing 'AND'
      if (whereClause.isNotEmpty) {
        whereClause = whereClause.substring(0, whereClause.length - 5);
      }
    }

    final List<Map<String, dynamic>> maps = await dbClient!.query(
      'Vehicle',
      where: whereClause.isEmpty ? null : whereClause,
      whereArgs: whereArgs.isEmpty ? null : whereArgs,
    );

    return List.generate(maps.length, (i) {
      return Vehicle(
        carID: maps[i]['Car_ID'],
        availability: maps[i]['Availability'],
        priceToRent: maps[i]['price_to_rent'],
        year: maps[i]['Year'],
        model: maps[i]['Model'],
        noKM: maps[i]['No_KM'],
        color: maps[i]['Color'],
        currentCity: maps[i]['Current_City'],
        registrationInformation: maps[i]['Registration_information'],
        ownerID: maps[i]['Owner_ID'],
      );
    });
  }
}
