import 'package:carrental/core/DB/DBCarOwners.dart';
import 'package:carrental/core/models/carOwner.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:flutter/material.dart';

class AddCarOwner extends StatefulWidget {
  const AddCarOwner({super.key});

  @override
  State<AddCarOwner> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarOwner> {
  CarOwner carOwner = CarOwner();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Text(
              " Insert an Owner",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "email",
              onchanged: (p0) {
                carOwner.email = p0;
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "first",
              onchanged: (p0) {
                carOwner.firstName = p0;
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "last",
              onchanged: (p0) {
                carOwner.lastName = p0;
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "price for rent",
              onchanged: (p0) {
                carOwner.paymentPerMonth = int.parse(p0);
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "Current city",
              onchanged: (p0) {
                carOwner.address = p0;
              },
            ),
            const SizedBox(height: 30),
            CustomTextField(
              hinttext: "registeration info",
              onchanged: (p0) {
                carOwner.password = p0;
                 carOwner.natID = p0;
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "add",
              ontap: () async {
                //call here insert customer
                await DBCarOwner.insertCarOwner(carOwner);
              },
              color: Colors.black,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "get all customsers",
              ontap: () async {
                //call here insert customer
                await DBCarOwner.printAllCarOwnersInfo();
              },
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
