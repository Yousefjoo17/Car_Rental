import 'package:carrental/core/DB/DBCustomer.dart';
import 'package:carrental/core/models/customser.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:flutter/material.dart';

class AddCustomerView extends StatefulWidget {
  const AddCustomerView({super.key});

  @override
  State<AddCustomerView> createState() => _AddCustomerViewState();
}

Customer customer = Customer();

class _AddCustomerViewState extends State<AddCustomerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 50),
          const Text(
            "insert customser",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hinttext: "Email",
            onchanged: (p0) {
              customer.email = p0;
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hinttext: "password",
            onchanged: (p0) {
              customer.password = p0;
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hinttext: "First name",
            onchanged: (p0) {
           customer.firstName = p0;
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hinttext: "Last name",
            onchanged: (p0) {
              customer.lastName = p0;
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hinttext: "address",
            onchanged: (p0) {
            customer.address = p0;
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hinttext: "Driving licesnse",
            onchanged: (p0) {
            customer.drivingLicense = p0;
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hinttext: "national ID",
            onchanged: (p0) {
            customer.natId = p0;
            },
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: "add",
            ontap: () {
              DBCustomer.insertCustomer(customer);
            },
            color: Colors.black,
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: "get all customsers",
            ontap: () async {
              await DBCustomer.printAllCustomersInfo();
            },
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
