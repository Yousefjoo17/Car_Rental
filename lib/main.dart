import 'package:carrental/core/DB/DBTables.dart';
import 'package:carrental/core/models/customser.dart';
import 'package:carrental/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carrental/features/carOwner/CarOwnwerauth/CarOwnerauth_cubit.dart';

// Other imports...

bool iscustomer = false;
bool isAdmin = false;
bool isCarOwner = false;
late SqlDb sqlDb;

Customer customer = Customer();

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized

  sqlDb = SqlDb();
  await sqlDb.db;

  runApp(const CarRental());
}

class CarRental extends StatelessWidget {
  const CarRental({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CarOwnerAuthCubit()),
      ],
      child: MaterialApp(
        title: 'Car Rental',
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        theme: ThemeData(),
      ),
    );
  }
}
