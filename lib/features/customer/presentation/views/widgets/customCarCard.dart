import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/features/customer/presentation/views/bookingCarView.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCarCard extends StatelessWidget {
  const CustomCarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BookingCarView()),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            //height: 120,
            //width: 200,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.grey.withOpacity(.2),
                spreadRadius: 0,
                offset: const Offset(5, 0),
              )
            ]),
            child: const Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      r'2000$ pm',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BMW',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            //top: -20,
            bottom: 70,
            child: Image.asset(
              AssetsData.logo,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
