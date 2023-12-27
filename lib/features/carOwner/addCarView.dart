import 'package:carrental/core/DB/DBVeihcle.dart';
import 'package:carrental/core/models/veihcle.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:flutter/material.dart';

class AddCarView extends StatefulWidget {
  const AddCarView({super.key});

  @override
  State<AddCarView> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarView> {
   Vehicle? vehicle=Vehicle(ownerID: 1,availability: 1,noKM: 0);
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Text(
              " Insert a Car",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "model",
              onchanged: (p0) {
                vehicle!.model = p0;
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "year",
              onchanged: (p0) {
                vehicle!.year = p0;
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "Color",
              onchanged: (p0) {
                vehicle!.color = p0;
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "price for rent",
              onchanged: (p0) {
                vehicle!.priceToRent = int.parse(p0);
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "Current city",
              onchanged: (p0) {
                vehicle!.currentCity = p0;
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "registeration info",
              onchanged: (p0) {
                vehicle!.registrationInformation = p0;
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "add",
              ontap: () async{
                //call here insert customer
                await DBVehicle.insertVehicle(vehicle!);
              },
              color: Colors.black,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "get all cars",
              ontap: () async {
                //call here insert customer
              await  DBVehicle.printAllVehiclesInfo();
              },
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
