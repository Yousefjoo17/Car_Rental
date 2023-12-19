import 'package:carrental/features/home/presentation/view_model/carOwner.dart';
import 'package:carrental/features/home/presentation/view_model/carOwnerPhone.dart';
import 'package:carrental/features/home/presentation/view_model/contractWith.dart';
import 'package:carrental/features/customer/presentation/view_model/customerPhoneEntery.dart';
import 'package:carrental/features/customer/presentation/view_model/customser.dart';
import 'package:carrental/features/home/presentation/view_model/employee.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'CarRental.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("onUpgrade =====================================");
  }

  _onCreate(Database db, int version) async {
    //customers table
    await db.execute('''
      CREATE TABLE Customer (
        Cust_ID INTEGER PRIMARY KEY,
        First_Name TEXT NOT NULL,
        Last_Name TEXT NOT NULL,
        Address TEXT NOT NULL,
        Driving_license TEXT NOT NULL,
        Nat_ID INTEGER NOT NULL UNIQUE
      )
    ''');

//Car owners table
    await db.execute('''
      CREATE TABLE Car_Owner (
        Owner_ID INTEGER PRIMARY KEY,
        First_Name TEXT NOT NULL,
        Last_Name TEXT NOT NULL,
        Nat_ID TEXT NOT NULL UNIQUE,
        Address TEXT NOT NULL,
        Payment_per_month INTEGER NOT NULL
      )
    ''');


  await db.execute('''
      CREATE TABLE Employee (
        Employee_ID INTEGER PRIMARY KEY,
        Address TEXT NOT NULL,
        First_Name TEXT NOT NULL,
        Last_Name TEXT NOT NULL,
        Nat_ID TEXT NOT NULL UNIQUE
      )
    ''');

   await db.execute('''
      CREATE TABLE Contracts_with (
        Owner_ID INTEGER NOT NULL,
        Employee_ID INTEGER NOT NULL,
        PRIMARY KEY (Owner_ID, Employee_ID),
        FOREIGN KEY (Owner_ID) REFERENCES Car_Owner(Owner_ID) ON DELETE NO ACTION ON UPDATE CASCADE,
        FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID) ON DELETE NO ACTION ON UPDATE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE Customer_phone (
        Phone INTEGER NOT NULL,
        Cust_ID INTEGER NOT NULL,
        PRIMARY KEY (Phone, Cust_ID),
        FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID) ON DELETE CASCADE ON UPDATE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE Car_Owner_Phone (
        Phone INTEGER NOT NULL,
        Owner_ID INTEGER NOT NULL,
        PRIMARY KEY (Phone, Owner_ID),
        FOREIGN KEY (Owner_ID) REFERENCES Car_Owner(Owner_ID) ON DELETE CASCADE ON UPDATE CASCADE
      )
    ''');

    print("onCreate =====================================");
  }

  // Insert a new customer
  Future<int> insertCustomer(Customer customer) async {
    final Database? database = await db;
    return await database!.insert('Customer', customer.toMap());
  }

  // Get all customers
  Future<List<Customer>> getCustomers() async {
    final Database? database = await db;
    final List<Map<String, dynamic>> maps = await database!.query('Customer');
    return List.generate(maps.length, (i) {
      return Customer(
        custId: maps[i]['Cust_ID'],
        firstName: maps[i]['First_Name'],
        lastName: maps[i]['Last_Name'],
        address: maps[i]['Address'],
        drivingLicense: maps[i]['Driving_license'],
        natId: maps[i]['Nat_ID'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

  Future<void> printAllCustomers() async {
    final List<Customer> customers = await getCustomers();

    if (customers.isEmpty) {
      print('No customers found.');
    } else {
      print('List of Customers:');
      for (final customer in customers) {
        print('Customer ID: ${customer.custId}');
        print('Name: ${customer.firstName} ${customer.lastName}');
        print('Address: ${customer.address}');
        print('Driving License: ${customer.drivingLicense}');
        print('National ID: ${customer.natId}');
        print('------------------------');
      }
    }
  }

  /**********************/
  Future<int> insertCarOwner(CarOwner carOwner) async {
    final Database? database = await db;
    return await database!.insert('Car_Owner', carOwner.toMap());
  }

  Future<List<CarOwner>> getCarOwners() async {
    final Database? database = await db;
    final List<Map<String, dynamic>> maps = await database!.query('Car_Owner');
    return List.generate(maps.length, (i) {
      return CarOwner(
        ownerId: maps[i]['Owner_ID'],
        firstName: maps[i]['First_Name'],
        lastName: maps[i]['Last_Name'],
        natId: maps[i]['Nat_ID'],
        address: maps[i]['Address'],
        paymentPerMonth: maps[i]['Payment_per_month'],
      );
    });
  }

   Future<void> printAllCarOwners() async {
    final List<CarOwner> carOwners = await getCarOwners();

    if (carOwners.isEmpty) {
      print('No car owners found.');
    } else {
      print('List of Car Owners:');
      for (final carOwner in carOwners) {
        print('Owner ID: ${carOwner.ownerId}');
        print('Name: ${carOwner.firstName} ${carOwner.lastName}');
        print('Nat ID: ${carOwner.natId}');
        print('Address: ${carOwner.address}');
        print('Payment per month: ${carOwner.paymentPerMonth}');
        print('------------------------');
      }
    }
  }
   
   /******************************************************************/


   // Insert a new employee
  Future<int> insertEmployee(Employee employee) async {
    final Database? database = await db;
    return await database!.insert('Employee', employee.toMap());
  }

  // Get all employees
  Future<List<Employee>> getEmployees() async {
    final Database? database = await db;
    final List<Map<String, dynamic>> maps = await database!.query('Employee');
    return List.generate(maps.length, (i) {
      return Employee(
        employeeID: maps[i]['Employee_ID'],
        address: maps[i]['Address'],
        firstName: maps[i]['First_Name'],
        lastName: maps[i]['Last_Name'],
        natID: maps[i]['Nat_ID'],
      );
    });
  }

  // Print all employees
  Future<void> printAllEmployees() async {
    final List<Employee> employees = await getEmployees();

    if (employees.isEmpty) {
      print('No employees found.');
    } else {
      print('List of Employees:');
      for (final employee in employees) {
        print('Employee ID: ${employee.employeeID}');
        print('Name: ${employee.firstName} ${employee.lastName}');
        print('Nat ID: ${employee.natID}');
        print('Address: ${employee.address}');
        print('------------------------');
      }
    }
  }

/**************************************************************************/
 // Insert a new contract entry
  Future<int> insertContractEntry(ContractsEntry contractEntry) async {
    final Database? database = await db;
    return await database!.insert('Contracts_with', contractEntry.toMap());
  }

  // Get all contract entries
  Future<List<ContractsEntry>> getContractEntries() async {
    final Database? database = await db;
    final List<Map<String, dynamic>> maps = await database!.query('Contracts_with');
    return List.generate(maps.length, (i) {
      return ContractsEntry(
        ownerID: maps[i]['Owner_ID'],
        employeeID: maps[i]['Employee_ID'],
      );
    });
  }

  // Print all contract entries
  Future<void> printAllContractEntries() async {
    final List<ContractsEntry> contractEntries = await getContractEntries();

    if (contractEntries.isEmpty) {
      print('No contract entries found.');
    } else {
      print('List of Contract Entries:');
      for (final contractEntry in contractEntries) {
        print('Owner ID: ${contractEntry.ownerID}');
        print('Employee ID: ${contractEntry.employeeID}');
        print('------------------------');
      }
    }
  }

  /***************************************************************/
   // Insert a new customer phone entry
  Future<int> insertCustomerPhoneEntry(CustomerPhoneEntry customerPhoneEntry) async {
    final Database? database = await db;
    return await database!.insert('Customer_phone', customerPhoneEntry.toMap());
  }

  // Get all customer phone entries
  Future<List<CustomerPhoneEntry>> getCustomerPhoneEntries() async {
    final Database? database = await db;
    final List<Map<String, dynamic>> maps = await database!.query('Customer_phone');
    return List.generate(maps.length, (i) {
      return CustomerPhoneEntry(
        phone: maps[i]['Phone'],
        custID: maps[i]['Cust_ID'],
      );
    });
  }

  // Print all customer phone entries
  Future<void> printAllCustomerPhoneEntries() async {
    final List<CustomerPhoneEntry> customerPhoneEntries = await getCustomerPhoneEntries();

    if (customerPhoneEntries.isEmpty) {
      print('No customer phone entries found.');
    } else {
      print('List of Customer Phone Entries:');
      for (final customerPhoneEntry in customerPhoneEntries) {
        print('Phone: ${customerPhoneEntry.phone}');
        print('Customer ID: ${customerPhoneEntry.custID}');
        print('------------------------');
      }
    }
  }

/****************************************************/
// Insert a new car owner phone entry
  Future<int> insertCarOwnerPhoneEntry(CarOwnerPhoneEntry carOwnerPhoneEntry) async {
    final Database? database = await db;
    return await database!.insert('Car_Owner_Phone', carOwnerPhoneEntry.toMap());
  }

  // Get all car owner phone entries
  Future<List<CarOwnerPhoneEntry>> getCarOwnerPhoneEntries() async {
    final Database? database = await db;
    final List<Map<String, dynamic>> maps = await database!.query('Car_Owner_Phone');
    return List.generate(maps.length, (i) {
      return CarOwnerPhoneEntry(
        phone: maps[i]['Phone'],
        ownerID: maps[i]['Owner_ID'],
      );
    });
  }

  // Print all car owner phone entries
  Future<void> printAllCarOwnerPhoneEntries() async {
    final List<CarOwnerPhoneEntry> carOwnerPhoneEntries = await getCarOwnerPhoneEntries();

    if (carOwnerPhoneEntries.isEmpty) {
      print('No car owner phone entries found.');
    } else {
      print('List of Car Owner Phone Entries:');
      for (final carOwnerPhoneEntry in carOwnerPhoneEntries) {
        print('Phone: ${carOwnerPhoneEntry.phone}');
        print('Owner ID: ${carOwnerPhoneEntry.ownerID}');
        print('------------------------');
      }
    }
  }
}
