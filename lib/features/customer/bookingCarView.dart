import 'package:carrental/constants.dart';
import 'package:carrental/core/DB/DBRentalAgreement.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/models/Date.dart';
import 'package:carrental/core/models/RentalAgreement.dart';
import 'package:carrental/core/models/veihcle.dart';
import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:carrental/features/customer/widgets/dateRow.dart';
import 'package:carrental/main.dart';
import 'package:flutter/material.dart';

class BookingCarView extends StatefulWidget {
  const BookingCarView({super.key, required this.vehicle});
  final Vehicle vehicle;
  @override
  State<BookingCarView> createState() => _BookingCarViewState();
}

class _BookingCarViewState extends State<BookingCarView> {
  DateClass dateClass = DateClass();
  RentalAgreement rentalAgreement = RentalAgreement();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: customBoxDecoration(
            [kprimaryColor3, kprimaryColor1, kprimaryColor0]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Image.asset(AssetsData.car2),
                  const SizedBox(height: 40),
                  Text(
                    widget.vehicle.model!,
                    style: const TextStyle(color: Colors.white, fontSize: 34),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.vehicle.priceToRent.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.vehicle.currentCity!,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.vehicle.year!,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(height: 20),
                  DateRow(dateClass: dateClass),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hinttext: 'returned city',
                    onchanged: (p0) {
                      rentalAgreement.returnCity = p0; //
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                      text: 'Rent',
                      ontap: () {
                        if (formkey.currentState!.validate()) {
                          rentalAgreement.carID = widget.vehicle.carID;
                          rentalAgreement.custID = currCustomer!.custId;
                          rentalAgreement.pickUpCity =
                              widget.vehicle.currentCity;
                          rentalAgreement.pickUpDate =
                              '${dateClass.startMonth}/${dateClass.startYear}';
                          rentalAgreement.rentalAgreementDate = '1';
                          rentalAgreement.returnDate =
                              '${dateClass.endMonth}/${dateClass.endYear}';
                          rentalAgreement.review = 'good';
                          rentalAgreement.payment = widget.vehicle.priceToRent;
                          DBRentalAgreement.addRentalAgreement(rentalAgreement);
                          DBRentalAgreement.printAllRentalAgreements();
                        }
                      },
                      color: kprimaryColor3)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
