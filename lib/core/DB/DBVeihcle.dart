import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/veihcle.dart';

class DBVehicle {
  Future<void> insertVehicle(Vehicle vehicle) async {
    final dbClient = await SqlDb().db;
    await dbClient!.insert('Vehicle', vehicle.toMap());
  }

  Future<List<Vehicle>> getAllVehicles() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Vehicle');
    return List.generate(maps.length, (i) {
      return Vehicle(
        carID: maps[i]['Car_ID'],
        availability: maps[i]['Availability'] == 1,
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

  Future<void> printAllVehiclesInfo() async {
    final vehicles = await getAllVehicles();
    vehicles.forEach((vehicle) {
      print('Car ID: ${vehicle.carID}');
      print('Availability: ${vehicle.availability}');
      print('Price to Rent: ${vehicle.priceToRent}');
      print('Year: ${vehicle.year}');
      print('Model: ${vehicle.model}');
      print('No KM: ${vehicle.noKM}');
      print('Color: ${vehicle.color}');
      print('Current City: ${vehicle.currentCity}');
      print('Registration Information: ${vehicle.registrationInformation}');
      print('Owner ID: ${vehicle.ownerID}\n');
    });
  }
}