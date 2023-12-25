import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/contractWith.dart';

class DBContractWith {
  Future<void> insertContract(Contract contract) async {
    final dbClient = await SqlDb().db;
    await dbClient!.insert('Contracts_with', contract.toMap());
  }

  Future<List<Contract>> getAllContracts() async {
    final dbClient = await SqlDb().db;
    final List<Map<String, dynamic>> maps = await dbClient!.query('Contracts_with');
    return List.generate(maps.length, (i) {
      return Contract(
        ownerID: maps[i]['Owner_ID'],
        employeeID: maps[i]['Employee_ID'],
      );
    });
  }

  Future<void> printAllContractsInfo() async {
    final contracts = await getAllContracts();
    contracts.forEach((contract) {
      print('Owner ID: ${contract.ownerID}');
      print('Employee ID: ${contract.employeeID}\n');
    });
  }
}
