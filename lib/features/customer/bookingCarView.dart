import 'package:carrental/constants.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/models/Date.dart';
import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/features/customer/widgets/dateRow.dart';
import 'package:flutter/material.dart';

class BookingCarView extends StatefulWidget {
  const BookingCarView({super.key});

  @override
  State<BookingCarView> createState() => _BookingCarViewState();
}

class _BookingCarViewState extends State<BookingCarView> {
  DateClass dateClass = DateClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: customBoxDecoration(
            [kprimaryColor3, kprimaryColor1, kprimaryColor0]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Image.asset(AssetsData.car2),
              const SizedBox(height: 40),
              const Text(
                'Audi',
                style: TextStyle(color: Colors.white, fontSize: 34),
              ),
              const SizedBox(height: 20),
              const Text(
                'Radio Remote Control 1/14 Bugatti Veyron 16.4 Grand Sport Vitesse Licensed RC Model Car (Black/Blue)',
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              const SizedBox(height: 20),
              const Text(
                'Faiyom',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(height: 20),
              const Text(
                '1200 km',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(height: 20),
              DateRow(dateClass: dateClass),
              const SizedBox(height: 20),
              CustomButton(
                  text: 'Rent',
                  ontap: () {
                    print(dateClass.startYear);
                    print(dateClass.startMonth);
                    print(dateClass.endYear);
                    print(dateClass.endMonth);
                  },
                  color: kprimaryColor3)
            ],
          ),
        ),
      ),
    );
  }
}
