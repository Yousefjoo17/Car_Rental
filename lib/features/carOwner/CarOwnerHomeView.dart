import 'package:carrental/constants.dart';
import 'package:carrental/core/DB/DBCarOwners.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/models/veihcle.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/features/carOwner/addCarView.dart';
import 'package:carrental/features/carOwner/widgets/CarRegisterd.dart';
import 'package:carrental/main.dart';
import 'package:flutter/material.dart';

class CarOwnerHomeView extends StatefulWidget {
  const CarOwnerHomeView({super.key});

  @override
  State<CarOwnerHomeView> createState() => _CarOwnerHomeViewState();
}

class _CarOwnerHomeViewState extends State<CarOwnerHomeView> {
  List<Vehicle> Vechicles = [];
  @override
  void initState() {
    setState(() {
      fetch();
    });
    super.initState();
  }

  Future<void> fetch() async {
    Vechicles = await DBCarOwner.getVehiclesByOwnerId(currCarOwner!.ownerID!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: customBoxDecoration(
            [kprimaryColor0, kprimaryColor1, kprimaryColor3]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'your registed cars',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: Vechicles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CarRegisterd(
                      vehicle: Vechicles[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              CustomButton(
                text: "Add Car",
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddCarView()),
                  );
                },
                color: kprimaryColor3,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
