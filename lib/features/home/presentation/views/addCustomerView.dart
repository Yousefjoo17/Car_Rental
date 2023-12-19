import 'package:carrental/core/DB.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:carrental/features/customer/presentation/view_model/customser.dart';
import 'package:flutter/material.dart';

class AddCustomerView extends StatelessWidget {
  const AddCustomerView({super.key, required this.customer});
  final Customer customer;
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
            hinttext: "ID",
            onchanged: (p0) {
              customer.custId = int.parse(p0);
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
              //call here insert customer
              SqlDb().insertCustomer(customer);
            },
            color: Colors.black,
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: "get all customsers",
            ontap: () async {
              //call here insert customer
              await SqlDb().printAllCustomers();
            },
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
