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
    String path = join(databasepath, 'Car55.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("onUpgrade =====================================");
  }

  _onCreate(Database db, int version) async {

   await db.execute('''
  CREATE TABLE Customer (
    Cust_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    First_Name TEXT NOT NULL,
    Last_Name TEXT NOT NULL,
    Address TEXT NOT NULL,
    Driving_license TEXT NOT NULL,
    Nat_ID TEXT NOT NULL UNIQUE,
    Email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
  )
''');

   await db.execute('''
      CREATE TABLE Car_Owner (
        Owner_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        First_Name TEXT NOT NULL,
        Last_Name TEXT NOT NULL,
        Nat_ID TEXT NOT NULL UNIQUE,
        Address TEXT NOT NULL,
        Payment_per_month INTEGER NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');
  
    await db.execute('''
      CREATE TABLE Customer_phone (
        Phone TEXT NOT NULL,
        Cust_ID INTEGER NOT NULL,
        PRIMARY KEY (Phone, Cust_ID),
        FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID) ON DELETE CASCADE ON UPDATE CASCADE
      )
    ''');
    await db.execute('''
      CREATE TABLE Car_Owner_Phone (
        Phone TEXT NOT NULL,
        Owner_ID INTEGER NOT NULL,
        PRIMARY KEY (Phone, Owner_ID),
        FOREIGN KEY (Owner_ID) REFERENCES Car_Owner(Owner_ID) ON DELETE CASCADE ON UPDATE CASCADE
      )
    ''');

/*************************************************/

await db.execute('''
      CREATE TABLE Vehicle (
        Car_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        Availability INTEGER NOT NULL,
        price_to_rent INTEGER NOT NULL,
        Year TEXT NOT NULL,
        Model TEXT NOT NULL,
        No_KM REAL NOT NULL,
        Color TEXT NOT NULL,
        Current_City TEXT NOT NULL,
        Registration_information TEXT NOT NULL,
        Owner_ID INTEGER NOT NULL,
        FOREIGN KEY (Owner_ID) REFERENCES Car_Owner(Owner_ID) ON DELETE CASCADE ON UPDATE CASCADE
      )
    ''');

    await db.execute('''
  CREATE TABLE Rental_Agreement (
    Rental_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Return_city TEXT NOT NULL,
    Pick_up_city TEXT NOT NULL,
    Pick_up_date TEXT NOT NULL,
    Return_date TEXT NOT NULL,
    Rental_agreement_date TEXT NOT NULL,
    Review TEXT,
    Cust_ID INTEGER NOT NULL,
    Car_ID INTEGER NOT NULL,
    Payment INTEGER Not NULL,
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID) ON DELETE NO ACTION ON UPDATE CASCADE, 
    FOREIGN KEY (Car_ID) REFERENCES Vehicle(Car_ID) ON DELETE NO ACTION ON UPDATE CASCADE
  )
''');

     await db.execute('''
      CREATE TABLE Maintenance (
        Start_date TEXT NOT NULL,
        End_Date TEXT NOT NULL,
        Cost INTEGER NOT NULL,
        Description TEXT NOT NULL,
        Maintenace_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        Car_ID INTEGER NOT NULL,
        FOREIGN KEY (Car_ID) REFERENCES Vehicle(Car_ID) ON DELETE NO ACTION ON UPDATE CASCADE
      )
    ''');
    /****************************************** */


  
      
    print("onCreate =======================================================================");
  }
   
}
